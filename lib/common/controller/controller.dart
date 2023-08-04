import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/models/user_model.dart';

class AppController extends GetxController {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  static AppController get find => Get.find<AppController>();

  final user = Patient(
    bloodGroup: "",
    emailAddress: "",
    emergencyContact: "",
    emergencyContactName: "",
    fullName: "",
    gender: "",
    weight: 0.0,
    uid: "",
    dateOfBirth: DateTime.now(),
    phoneNumber: "",
    isOnline: true,
    profilePic: "",
  ).obs;

  final loading = true.obs;

  @override
  void onReady() {
    super.onReady();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    var userID = FirebaseAuth.instance.currentUser?.uid ?? "";

    var data = await FirebaseFirestore.instance
        .collection('patients')
        .doc(userID)
        .get();

    user.value = Patient.fromMap(data.data() ?? {});
  }
}
