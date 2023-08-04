import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:medoc_patient_app/common/constants/constant.dart';
import 'package:medoc_patient_app/common/enum/auth_status.dart';
import 'package:medoc_patient_app/config/zegocloud.dart';
import 'package:medoc_patient_app/features/auth/repositories/auth_repositories.dart';
import 'package:medoc_patient_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final Rx<User?> user = Rx<User?>(null);
  RxString phoneNumber = "".obs;
  RxString gender = "".obs;
  ZegoUIKitPrebuiltCallController? callController;

  // String cacheUserIDKey = 'cache_user_id_key';

  void onUserLogout() {
    callController = null;

    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }

  /// local virtual logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(cacheUserIDKey);
  }

  // Patient patient = Patient(
  //   fullName: '',
  //   dateOfBirth: DateTime.now(),
  //   gender: '',
  //   emailAddress: '',
  //   weight: 0.0,
  //   bloodGroup: '',
  //   emergencyContact: '',
  //   emergencyContactName: '',
  //   phoneNumber: "",
  //   isOnline: false,
  // );

  Future<Patient?> getUserData() async {
    Patient? user = await _authRepository.getCurrentUserData();
    print(user);
    return user;
  }

  void signInWithPhone(BuildContext context, String phoneNumber) {
    _authRepository.signInWithPhone(context, phoneNumber);
  }

  void registerWithEmailAndPassword({
    required String displayName,
    required String email,
    required String password,
  }) async {
    var userCredential = await _authRepository.registerWithEmailAndPassword(
      email: email,
      password: password,
      displayName: displayName,
    );

    final userID = userCredential?.user?.uid ?? "";

    if (userCredential != null) {
      var patient = Patient(
        bloodGroup: "",
        emailAddress: email,
        emergencyContact: "",
        emergencyContactName: "",
        fullName: displayName,
        gender: "",
        weight: 0.0,
        uid: userID,
        dateOfBirth: DateTime.now(),
        phoneNumber: "",
        isOnline: true,
        profilePic: kProfilPicture,
      );

      await FirebaseFirestore.instance
          .collection('patients')
          .doc(userID)
          .set(patient.toMap());
    }
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    _authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }

  void saveUserDataToFirebase(
    BuildContext context,
    String fullName,
    String bloodGroup,
    String emailAddress,
    String emergencyContact,
    String emergencyContactName,
    String gender,
    double weight,
    String phoneNumber,
    DateTime dateOfBirth,
    File? profilePic,
  ) async {
    _authRepository.saveUserDataToFirebase(
      bloodGroup: bloodGroup,
      emailAddress: emailAddress,
      emergencyContact: emergencyContact,
      emergencyContactName: emergencyContactName,
      fullName: fullName,
      gender: gender,
      weight: weight,
      phoneNumber: phoneNumber,
      profilePic: profilePic,
      dateOfBirth: dateOfBirth,
      context: context,
    );

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(cacheUserIDKey, phoneNumber);

    Map<String, dynamic> data = {
      'id': phoneNumber,
      'name': fullName,
    };

    await prefs.setString('zegoInformation', jsonEncode(data));

    currentUser.id = phoneNumber;
    currentUser.name = fullName;

    print("Current userId" + currentUser.id);
    print("Current userName" + currentUser.name);

    ZIMKit().connectUser(
      id: currentUser.id,
      name: currentUser.name,
    );
    callController ??= ZegoUIKitPrebuiltCallController();

    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Utils.id,
      appSign: Utils.SignIn,
      userID: currentUser.id,
      userName: currentUser.name,
      notifyWhenAppRunningInBackgroundOrQuit: true,
      plugins: [ZegoUIKitSignalingPlugin()],
      controller: callController,
      requireConfig: (ZegoCallInvitationData data) {
        final config = (data.invitees.length > 1)
            ? ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
                : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

        // config.avatarBuilder = customAvatarBuilder;

        /// support minimizing, show minimizing button
        config.topMenuBarConfig.isVisible = true;
        config.topMenuBarConfig.buttons
            .insert(0, ZegoMenuBarButtonName.minimizingButton);

        return config;
      },
    );
  }

  void updatePhoneNumber(String? value) {
    if (value != null) {
      phoneNumber.value = value;
      // patient.phoneNumber = phoneNumber.value;
      print(phoneNumber.value);
    }
  }

  void updateGender(String value) {
    gender.value = value;
  }

  // // void signInWithPhoneNumber(String phoneNumber) async{
  // //   _authRepository.signInWithPhoneNumber(phoneNumber);
  // //   print(phoneNumber);
  // // }

  // // void verifyOTP(String verificationId, String smsCode) {
  // //   _authRepository.verifyOTP(verificationId, smsCode);
  // // }

  // void updateFullName(String value) {
  //   patient.fullName = value;
  // }

  // void updateDateOfBirth(DateTime value) {
  //   patient.dateOfBirth = value;
  // }

  // void updateEmailAddress(String value) {
  //   patient.emailAddress = value;
  // }

  // void updateWeight(double value) {
  //   patient.weight = value;
  // }

  // void updateBloodGroup(String value) {
  //   patient.bloodGroup = value;
  // }

  // void updateEmergencyContact(String value) {
  //   patient.emergencyContact = value;
  // }

  // void updateEmergencyContactName(String value) {
  //   patient.emergencyContactName = value;
  // }

  // void uploadPatientInformation() {
  //   _authRepository.uploadPatient(patient);
  //   print(patient.phoneNumber);
  // }

  @override
  void onInit() {
    super.onInit();

    // ZIMKit().connectUser(
    //   id: "678769279",
    //   name: "EnthCliff",
    // );

    // ZegoUIKitPrebuiltCallInvitationService().init(
    //   appID: Utils.id,
    //   appSign: Utils.SignIn,
    //   userID: "+237678769279",
    //   userName: "EnthCliff",
    //   notifyWhenAppRunningInBackgroundOrQuit: true,
    //   plugins: [ZegoUIKitSignalingPlugin()],
    //   controller: callController,
    //   requireConfig: (ZegoCallInvitationData data) {
    //     final config = (data.invitees.length > 1)
    //         ? ZegoCallType.videoCall == data.type
    //             ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
    //             : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
    //         : ZegoCallType.videoCall == data.type
    //             ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
    //             : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

    //     // config.avatarBuilder = customAvatarBuilder;

    //     /// support minimizing, show minimizing button
    //     config.topMenuBarConfig.isVisible = true;
    //     config.topMenuBarConfig.buttons
    //         .insert(0, ZegoMenuBarButtonName.minimizingButton);

    //     return config;
    //   },
    // );
  }

  void signOut() {
    // Perform sign out
    // Clear the user value
    user.value = null;
    // phoneNumber.value = _preferences.getString('phoneNumber') ?? '';
  }
}
