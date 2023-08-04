import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/auth/controllers/auth_controller.dart';
import 'package:medoc_patient_app/features/doctor/controllers/doctor_controller.dart';
import 'package:medoc_patient_app/features/main/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/main/controllers/navigation_controller.dart';
import 'package:medoc_patient_app/features/medical_bot/controllers/symptom_controller.dart';
import 'package:medoc_patient_app/features/pharma/controllers/location_controller.dart';
import 'package:medoc_patient_app/features/pharma/controllers/pharmacy_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {

    Get.put(BottomNavigationController());
    Get.put(AuthController());
    Get.put<LocationController>(LocationController());
    Get.put(SearchController());
    Get.put(AppointmentController());
    Get.put(BookingController());
    Get.put(DoctorController());
    Get.put(PharmacyController());
    // Get.put(SymptomController());
  }
}