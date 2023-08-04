import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medoc_patient_app/common/enum/appointment_package.dart';
import 'package:medoc_patient_app/common/enum/payment_option.dart';
import 'package:medoc_patient_app/common/enum/reschedule_appointment_reason.dart';
import 'package:medoc_patient_app/features/appointment/repositories/appointment_repository.dart';
import 'package:medoc_patient_app/models/doctor_model.dart';
import 'package:medoc_patient_app/models/patient_detail_model.dart';

import '../../../models/appointment_model.dart';

class BookingController extends GetxController {
  final AppointmentRepository _appointmentRepository = AppointmentRepository();

  AppointmentRepository get appointmentRepository => _appointmentRepository;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxInt activeIndex = RxInt(-1);
  List Time = ["9:00AM", "10:00AM", "11:30AM", "12:00PM", "1:00PM"];
  RxString choosenDate = "".obs;
  RxString choosenTime = "".obs;
  var selectedPackage = Package.messages.obs;
  var selectedPayment = Payment.mtn.obs;

  var selectedGender = "".obs;
  var selectedRescheduleReason = RescheduleReason.scheduleClash.obs;
  var selectedDuration = "".obs;
  RxString patientName = ''.obs;
  RxInt patientAge = 0.obs;
  RxString patientProblem = "".obs;
  RxString patientGender = "".obs;
  RxString package = "".obs;
  RxString payment = "".obs;
  RxString doctorId = "".obs;
  RxList<Appointment> appointmentData = <Appointment>[].obs;
  RxList<Doctor> doctorData = <Doctor>[].obs;
  StreamSubscription<QuerySnapshot>? appointmentStreamSubscription;
  StreamSubscription<QuerySnapshot>? doctorStreamSubscription;
  RxString appointmentId = "".obs;

  void setAppointmentId(String value) {
    appointmentId.value = value;
  }

  void setDoctorId(String value) {
    doctorId.value = value;
    print(doctorId.value);
  }

  void setGender(String value) {
    patientGender.value = value;
  }

  void setPateintName(String value) {
    patientName.value = value;
  }

  void setPateintAge(String value) {
    patientAge.value = int.parse(value);
  }

  void setPatientProblem(String value) {
    patientProblem.value = value;
  }

  void selectGender(String value) {
    selectedGender.value = value;
  }

  void selectPackage(Package? value) {
    selectedPackage.value = value!;
  }

  void setDuration(String? value) {
    selectedDuration.value = value!;
  }

  void selectPayment(Payment? value) {
    selectedPayment.value = value!;
  }

  void selectRescheduleReason(RescheduleReason? value) {
    selectedRescheduleReason.value = value!;
  }

  void setSelectedDate(DateTime? date) {
    selectedDate.value = date;
    if (selectedDate.value != null) {
      String formattedDate =
          DateFormat('E d MMMM yyyy').format(selectedDate.value!);
      choosenDate.value = formattedDate;
    }
  }

  void setActiveIndex(int index) {
    activeIndex.value = index;
    String selectedTime = Time[activeIndex.value];
    choosenTime.value = selectedTime;
  }

  void createAppointment({
    required BuildContext context,
    required String doctorId,
    required DateTime selectedDate,
    required String time,
    required String selectedDuration,
    required String selectedPackage,
    required String selectedPayment,
  }) {
    final patientInformation = PatientDetail(
      patientName: patientName.value,
      patientGender: patientGender.value,
      patientAge: patientAge.value,
      patientProblem: patientProblem.value,
    );

    _appointmentRepository.uploadAppointmentInformation(
      context: context,
      doctorId: doctorId,
      selectedDate: selectedDate,
      time: time,
      selectedDuration: selectedDuration,
      selectedPackage: selectedPackage,
      patientDetail: patientInformation,
      selectedPayment: selectedPayment,
    );
  }

  final upComing = <Appointment>[].obs;

  List<Appointment> get appointments => appointmentData;
  List<Appointment> get upcomingAppointments => appointmentData
      .where((appointment) => appointment.status.value == 'Upcoming')
      .toList();
  List<Appointment> get completedAppointments => appointmentData
      .where((appointment) => appointment.status.value == 'Completed')
      .toList();
  List<Appointment> get canceledAppointments => appointmentData
      .where((appointment) => appointment.status.value == 'Canceled')
      .toList();

  void fetchAppointments() {
    appointmentStreamSubscription = _appointmentRepository
        .getAppointmentsStream()
        .listen((QuerySnapshot snapshot) {
      final List<Appointment> retrievedAppointments = snapshot.docs
          .map((doc) => Appointment.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      appointmentData.assignAll(retrievedAppointments);

      for (var appointment in appointmentData) {
        appointment.status.update((value) => value = 'Upcoming');
      }
    });
  }

  void updateAppointmentStatus(Appointment appointment, String status) {
    appointment.status.value = status;
    _appointmentRepository.updateAppointmentStatus(appointment);
  }

  void updateAppointment({
    required BuildContext context,
    required DateTime selectedDate,
    required String time,
  }) {
    _appointmentRepository.updateAppointment(
      context: context,
      selectedDate: selectedDate,
      time: time,
      appointmentId: appointmentId.value,
    );
  }

  RxList<Doctor> doctorList = RxList<Doctor>([]);


  void fetchDoctorDetails() {
    RxList<String> doctorIds = <String>[].obs;

    appointmentStreamSubscription = _appointmentRepository
        .getAppointmentsStream()
        .listen((QuerySnapshot snapshot) {
      final List<Appointment> retrievedAppointments = snapshot.docs
          .map((doc) => Appointment.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      appointmentData.assignAll(retrievedAppointments);

      for (var appointment in appointmentData) {
        String doctorId = appointment.doctorId;
        doctorIds.add(doctorId); // Add doctorId to the RxList
      }
    });

    print("App: ${doctorIds.value}");

    // for (var appointment in appointmentList) {
    //   String doctorId = appointment.doctorId;
    //   doctorIds.add(doctorId);
    // }

    // print("Doc: " + doctorIds.toString());
    // appointmentList.map((appointment) {
    //   appointment.doctorId;
    //   print("Doctor: ==============================================" +
    //       appointment.doctorId);
    // }).toList();

    // if (doctorIds.isEmpty) {
    //   print("===========================================00");// No doctor IDs to fetch
    //   return;
    // }

    // print(doctorIds);
    // print("DoctorIds: " + doctorIds.toString());

    _appointmentRepository.getDoctors([
      "IPU8mQLvrdc2o6hyff5hRq60E462",
      "hNJF3oTpxmMV4L28p1YBfUi0fl42"
    ]).then((doctors) {
      doctorList.value = doctors;
      print("DOCTORS $doctors");

      print("DOCTOR $doctorList");
    }).catchError((error) {
      print("Error getting doctors");
    });
  }


  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
    fetchDoctorDetails();
  }

  @override
  void onClose() {
    appointmentStreamSubscription?.cancel();
    super.onClose();
  }
}
