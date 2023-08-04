import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/snack_bar.dart';
import 'package:medoc_patient_app/models/appointment_model.dart';
import 'package:medoc_patient_app/models/doctor_model.dart';
import 'package:medoc_patient_app/models/patient_detail_model.dart';
import 'package:medoc_patient_app/models/user_model.dart';
import 'package:medoc_patient_app/routes.dart';

class AppointmentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');
  final CollectionReference _doctorsCollection =
      FirebaseFirestore.instance.collection('doctors');


  // Future<Doctor> getDoctorDetails(String doctorId) async {
  //   try {
  //     if (doctorId != null && doctorId.isNotEmpty) {
  //       final DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
  //           .collection('doctors')
  //           .doc(doctorId)
  //           .get();
  //       if (doctorSnapshot.exists) {
  //         final Map<String, dynamic>? doctorData =
  //             doctorSnapshot.data() as Map<String, dynamic>?;
  //         if (doctorData != null) {
  //           // print(doctorData);
  //           // print( Doctor.fromMap(doctorData));
  //           return Doctor.fromMap(doctorData);
  //         } else {
  //           throw Exception('Invalid doctor data');
  //         }
  //       } else {
  //         throw Exception('Doctor not found');
  //       }
  //     } else {
  //       throw Exception('Invalid doctor ID');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to retrieve doctor details: $e');
  //   }
  // }

  
  Future<void> uploadAppointmentInformation({
    required String doctorId,
    required DateTime selectedDate,
    required String time,
    required String selectedDuration,
    required String selectedPackage,
    required PatientDetail patientDetail,
    required String selectedPayment,
    required BuildContext context,
  }) async {
    try {
      // final Doctor doctor = await getDoctorDetails(doctorId);
      // print(doctor);

      final DocumentReference appointmentRef = _appointmentsCollection.doc();
      String appointmentId = appointmentRef.id;

      final Map<String, dynamic> appointmentData = {
        'doctorId': doctorId,
        'appointmentId': appointmentId,
        'PatientId': _firebaseAuth.currentUser?.uid,
        'selectedDate': Timestamp.fromDate(selectedDate),
        'time': time,
        'selectedDuration': selectedDuration,
        'selectedPackage': selectedPackage,
        'patientDetail': patientDetail.toJson(),
        'selectedPayment': selectedPayment,
        'status': 'Upcoming',
      };

      await appointmentRef.set(appointmentData);
      print('Appointment information uploaded successfully!');
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Stream<QuerySnapshot> getAppointmentsStream() {
    return _appointmentsCollection
        .where('PatientId', isEqualTo: _firebaseAuth.currentUser?.uid)
        .snapshots();
  }

  Future<void> updateAppointmentStatus(Appointment appointment) async {
    try {
      final DocumentReference appointmentRef =
          _appointmentsCollection.doc(appointment.appointmentId);
      // print(appointment.doctorId);

      final DocumentSnapshot appointmentSnapshot = await appointmentRef.get();
      if (appointmentSnapshot.exists) {
        final Map<String, dynamic> updatedData = {
          'status': appointment.status.value,
        };

        await appointmentRef.update(updatedData);
        print('Appointment status updated successfully!');
      } else {
        print('Document does not exist in Firestore!');
      }
    } catch (e) {
      print('Error updating appointment status: $e');
    }
  }

  Future<void> updateAppointment({
    required BuildContext context,
    required DateTime selectedDate,
    required String time,
    required String appointmentId,
  }) async {
    try {
      final DocumentReference appointmentRef =
          _appointmentsCollection.doc(appointmentId);

      final Map<String, dynamic> updatedData = {
        'appointmentId': appointmentId,
        'selectedDate': Timestamp.fromDate(selectedDate),
        'time': time,
        'status': 'Upcoming'
      };

      await appointmentRef.update(updatedData);
      Get.toNamed(AppRoutes.home);

      print('Appointment updated successfully!');
    } catch (e) {
      print('Error updating appointment: $e');
    }
  }

  Future<List<Appointment>> getAppointments() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _firestore.collection('appointments').get();
    return snapshot.docs.map((doc) => Appointment.fromMap(doc.data())).toList();
  }

  Future<List<Doctor>> getDoctors(List<String> doctorIds) async {
    // print("DoctorIds" + doctorIds.toString());
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('doctors')
        .where('uid', whereIn: doctorIds)
        .get();

    print("SNAPSHOT:  $snapshot");

    return snapshot.docs.map((doc) => Doctor.fromMap(doc.data())).toList();
  }

}
