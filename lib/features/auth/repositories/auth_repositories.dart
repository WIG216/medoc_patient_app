import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/snack_bar.dart';
import 'package:medoc_patient_app/models/user_model.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Patient?> getCurrentUserData() async {
    var userData = await _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .get();

    Patient? user;
    if (userData.data() != null) {
      user = Patient.fromMap(userData.data()!);
    }
    return user;
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
        codeSent: (
          (String verificationId, int? resendToken) async {
            Get.toNamed(
              AppRoutes.verifyPhoneNumber,
              arguments: {'verificationId': verificationId},
            );
          }
        ),
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
  required String phoneNumber,
  required DateTime dateOfBirth,
    required BuildContext context,

  }) async {
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      

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
      );

      await _firestore.collection('users').doc(uid).set(user.toMap());

     Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Stream<Patient> userData(String userId) {
    return _firestore.collection('users').doc(userId).snapshots().map(
          (event) => Patient.fromMap(
            event.data()!,
          ),
        );
  }

  void setUserState(bool isOnline) async {
    await _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      'isOnline': isOnline,
    });
  }
}

  // Future<void> signInWithPhoneNumber(String phoneNumber) async {
  //   await firebaseAuth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,

  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await firebaseAuth.signInWithCredential(credential);
  //     },
  //     verificationFailed: (e) {
  //       throw Exception(e.message);
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       Get.toNamed(AppRoutes.verifyPhoneNumber, arguments: {'verificationId': verificationId});
  //     },
  //     timeout: const Duration(seconds: 60),
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // Future<void> verifyOTP(String verificationId, String smsCode) async {
  //   AuthCredential credential = PhoneAuthProvider.credential(
  //     verificationId: verificationId,
  //     smsCode: smsCode,
  //   );
  //   await firebaseAuth.signInWithCredential(credential);
  //   Get.toNamed(AppRoutes.home);
  // }

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  // }

  // void uploadPatient(Patient patient) {
  //   String uid = _firebaseAuth.currentUser!.uid;
  //   final userData = {
  //     'full_name': patient.fullName,
  //     'date_of_birth': patient.dateOfBirth,
  //     'gender': patient.gender,
  //     'email_address': patient.emailAddress,
  //     'weight': patient.weight,
  //     'blood_group': patient.bloodGroup,
  //     'emergency_contact': patient.emergencyContact,
  //     'emergency_contact_name': patient.emergencyContactName,
  //   };
  //   print(uid);

  //   _firestore.collection('patients').doc(uid).set(userData).then((value) {
  //     print("USER DATA: ${userData}");
  //     Get.toNamed(AppRoutes.home);
  //     // Patient information uploaded successfully
  //     // You can show a success message or navigate to another screen
  //   }).catchError((error) {
  //     print(error);
  //     // An error occurred while uploading patient information
  //     // You can show an error message or handle the error accordingly
  //   });
  // }


