import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:medoc_patient_app/features/auth/repositories/auth_repositories.dart';
import 'package:medoc_patient_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  final Rx<User?> user = Rx<User?>(null);
  RxString phoneNumber = "".obs;
  RxString gender = "".obs;


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
  ) {
    _authRepository.saveUserDataToFirebase(
      bloodGroup: bloodGroup,
      emailAddress: emailAddress,
      emergencyContact: emergencyContact,
      emergencyContactName: emergencyContactName,
      fullName: fullName,
      gender: gender,
      weight: weight,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      context: context,
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

  void signOut() {
    // Perform sign out
    // Clear the user value
    user.value = null;
    // phoneNumber.value = _preferences.getString('phoneNumber') ?? '';
  }
}
