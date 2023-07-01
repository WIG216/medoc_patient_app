import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/auth/controllers/auth_controller.dart';
import 'package:medoc_patient_app/features/main/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/main/controllers/navigation_controller.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/location_controller.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/map_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {

    Get.put(BottomNavigationController());
    Get.put(AuthController());
    Get.put<LocationController>(LocationController());
    Get.put<MapController>(MapController());
    Get.put(SearchController());
    Get.put(AppointmentController());
    Get.put(BookingController());
  }
}