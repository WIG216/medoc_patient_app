import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/controller/controller.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/appointment/widgets/my_appointment_card.dart';
import 'package:medoc_patient_app/models/appointment_model.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:shimmer/shimmer.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() => _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final BookingController appointmentController = Get.put(BookingController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final controller = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed'),
            Tab(text: 'Canceled'),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: controller.appointmentRepository.getAppointmentsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerList();
          }

          if (snapshot.hasData) {
            final List<Appointment> allAppointments = snapshot.data!.docs
                .map((doc) {
                  return Appointment.fromMap(
                    doc.data() as Map<String, dynamic>,
                  );
                })
                .where((e) => e.patientId == AppController.find.userId)
                .toList();

            var upComing = <Appointment>[];
            var completed = <Appointment>[];
            var canceled = <Appointment>[];

            for (var appointment in allAppointments) {
              if (appointment.status.value == "Upcoming") {
                upComing.add(appointment);
              }
              if (appointment.status.value == "Canceled") {
                canceled.add(appointment);
              }
              if (appointment.status.value == "Completed") {
                completed.add(appointment);
              }
            }

            controller.upComing.value = upComing;

            if (allAppointments.isEmpty) {
              return Container();
            }

            return TabBarView(
              controller: _tabController,
              children: [
                buildAppointmentList(upComing),
                buildAppointmentList(completed),
                buildAppointmentList(canceled),
              ],
            );
          }

          if (snapshot.hasError) {
            return Container();
          }

          return Container();
        },
      ),
    );
  }

  Widget buildAppointmentList(List<Appointment> appointments) {
    final appointmentController = Get.find<BookingController>();

    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final Appointment appointment = appointments[index];
        final doctor = appointmentController.doctorList[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: MyAppointmentCard(
            date: appointment.selectedDate,
            doctorImage: doctor.profilePic,
            doctorName: doctor.name,
            icon: appointment.selectedPackage == "Package.messages"
                ? CupertinoIcons.chat_bubble_2_fill
                : appointment.selectedPackage == "Package.voiceCall"
                    ? CupertinoIcons.phone_fill
                    : appointment.selectedPackage == "Package.videoCall"
                        ? CupertinoIcons.videocam_fill
                        : Icons.home,
            package: appointment.selectedPackage,
            status: appointment.status.value,
            time: appointment.selectedDuration,
            onAccept: () {},
            reschedule: () {
              Get.toNamed(
                AppRoutes.reschedule_appointment_screen_0,
              );
              // appointmentController.setAppointmentId(appointment.appointmentId);
            },
          ),
        );
      },
    );
  }

  Widget _buildShimmerList() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: 1, // Number of shimmer placeholders
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            // direction: ShimmerDirection.ttb,
            period: const Duration(milliseconds: 1500),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              height: 150,
              child: MyAppointmentCard(
                date: DateTime.now(),
                doctorImage:
                    'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                doctorName: '',
                icon: Icons.abc,
                package: '',
                status: 'Canceled',
                reschedule: () {},
                time: '',
              ),
            ),
          );
        },
      ),
    );
  }
}
