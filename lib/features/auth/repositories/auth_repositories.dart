import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/enum/auth_status.dart';
import 'package:medoc_patient_app/common/repositories/common_firebase_storage_repository.dart';
import 'package:medoc_patient_app/common/utils/snack_bar.dart';
import 'package:medoc_patient_app/models/user_model.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final commonFirebaseStorageRepository = Get.put(
    CommonFirebaseStorageRepository(
      firebaseStorage: FirebaseStorage.instance,
    ),
  );
  var _status;

  Future<Patient?> getCurrentUserData() async {
    var userData = await _firestore
        .collection('patients')
        .doc(_firebaseAuth.currentUser?.uid)
        .get();

    Patient? user;
    if (userData.data() != null) {
      user = Patient.fromMap(userData.data()!);
    }
    return user;
  }

  Future<UserCredential?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firebaseAuth.currentUser!.updateDisplayName(displayName);

      _status = AuthStatus.successful;

      return userCredential;
    } catch (e) {
      return null;
    }
    /*  on FirebaseAuthException catch (e) {
      _status = AuthExceptionHandler.handleAuthException(e);
    } */
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await _firebaseAuth
        .sendPasswordResetEmail(email: email)
        .then((value) => _status = AuthStatus.successful)
        .catchError(
            (e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw Exception(e.message);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          Get.toNamed(
            AppRoutes.verifyPhoneNumber,
            arguments: {'verificationId': verificationId},
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await _firebaseAuth.signInWithCredential(credential);

      Get.toNamed(AppRoutes.user_information_screen);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String bloodGroup,
    required String emailAddress,
    required String emergencyContact,
    required String emergencyContactName,
    required String fullName,
    required String gender,
    required double weight,
    required File? profilePic,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required BuildContext context,
  }) async {
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      String photoUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      var user = Patient(
        bloodGroup: bloodGroup,
        emailAddress: emailAddress,
        emergencyContact: emergencyContact,
        emergencyContactName: emergencyContactName,
        fullName: fullName,
        gender: gender,
        weight: weight,
        uid: uid,
        dateOfBirth: dateOfBirth,
        phoneNumber: phoneNumber,
        isOnline: true,
        profilePic: photoUrl,
      );

      if (profilePic != null) {
        photoUrl = await commonFirebaseStorageRepository.storeFileToFirebase(
          'PatientImage/"$fullName $uid"',
          profilePic,
        );
      }

      await _firestore.collection('patients').doc(uid).set(user.toMap());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Stream<Patient> userData(String userId) {
    return _firestore.collection('doctors').doc(userId).snapshots().map(
          (event) => Patient.fromMap(
            event.data()!,
          ),
        );
  }

  void setUserState(bool isOnline) async {
    await _firestore
        .collection('doctors')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      'isOnline': isOnline,
    });
  }
}
