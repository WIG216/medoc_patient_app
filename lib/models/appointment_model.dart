import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/models/patient_detail_model.dart';

class Appointment {
  final String doctorId;
  final String patientId;
  final String appointmentId;
  final DateTime? selectedDate;
  final String time;
  final String selectedDuration;
  final String selectedPackage;
  final PatientDetail patientDetail;
  final String selectedPayment;
  final RxString status;

  Appointment({
    required this.doctorId,
    required this.selectedDate,
    required this.time,
    required this.selectedDuration,
    required this.selectedPackage,
    required this.patientDetail,
    required this.selectedPayment,
    required String status,
    required this.patientId,
    required this.appointmentId,
  }) : status = status.obs;

  Map<String, dynamic> toMap() {
    return {
      'doctorId': doctorId,
      'PatientId': patientId,
      'appointmentId': appointmentId,
      'selectedDate': selectedDate,
      'time': time,
      'selectedDuration': selectedDuration,
      'selectedPackage': selectedPackage,
      'patientDetail': patientDetail.toMap(),
      'selectedPayment': selectedPayment,
      'status': status.value,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    Timestamp? selectedDateTimestamp = map['selectedDate'];
    DateTime? selectedDate =
        selectedDateTimestamp != null ? selectedDateTimestamp.toDate() : null;

    return Appointment(
      doctorId: map['doctorId'],
      selectedDate: selectedDate,
      time: map['time'],
      selectedDuration: map['selectedDuration'],
      selectedPackage: map['selectedPackage'],
      patientDetail: PatientDetail.fromMap(map['patientDetail']),
      selectedPayment: map['selectedPayment'],
      status: map['status'],
      appointmentId: map['appointmentId'],
      patientId: map['PatientId'] ?? "",
    );
  }
}
