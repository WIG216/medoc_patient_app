import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medoc_patient_app/common/controller/controller.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/doctor/controllers/doctor_controller.dart';
import 'package:medoc_patient_app/features/main/widgets/appointment_card.dart';
import 'package:medoc_patient_app/features/main/widgets/category_icon.dart';
import 'package:medoc_patient_app/features/main/widgets/doctor_card.dart';
import 'package:medoc_patient_app/models/appointment_model.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _doctorController = Get.find<DoctorController>();
  final _bookingController = Get.find<BookingController>();

  final appController = Get.find<AppController>();

  Widget _buildShimmerList() {
    return ListView.builder(
      itemCount: 5, // Number of shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: const DoctorCard(
            doctorName:
                'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
            doctorTitle: '',
            imagePath: '',
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: ListTile(
          contentPadding: const EdgeInsets.only(
            bottom: 8,
          ),
          leading: CircleAvatar(
            backgroundColor: lightBgColor.withOpacity(0.2),
            radius: 20,
            child: const Icon(
              Icons.health_and_safety_outlined,
              color: whiteColor,
            ),
          ),
          title: Text(
            "Welcome back!",
            style: TextStyle(
              color: whiteColor.withOpacity(0.8),
              fontSize: 13,
            ),
          ),
          subtitle: Obx(
            () => Text(
              appController.user.value.fullName,
              style: smallHeaderStyle.copyWith(
                color: whiteColor,
              ),
            ),
          ),
          trailing: const Icon(
            Icons.notifications,
            color: whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.height,

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 85,
                child: CategoryIcons(),
              ),
            ),
            8.height,
            ListTile(
              leading: Text(
                "Next Appointment",
                style: mediumHeaderStyle,
              ),
              trailing: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.my_appointment),
                child: Text(
                  "See more",
                  style: subtitleStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: Builder(
                builder: (context) {
                  final List<Appointment> upcomingAppointments =
                      _bookingController.upComing;

                  if (upcomingAppointments.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: NoDataFound(
                        width: double.infinity,
                        height: 80,
                      ),
                    );
                  }

                  return SizedBox(
                    // height: 120,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingAppointments.length,
                        itemBuilder: (context, index) {
                          final Appointment appointment =
                              upcomingAppointments[index];

                          return SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            child: AppointmentCard(
                              onTap: () => Get.back(),
                              appointmentDate: DateFormat('E d MMMM yy')
                                  .format(appointment.selectedDate!),
                              appointmentTime: appointment.time,
                              doctorName: appointment.doctorId,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // SizedBox(
            //   height: 120,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //     child: ListView.builder(
            //       itemBuilder: (context, index) {
            //         final Appointment appointment = upcomingAppointments[index];

            //         return AppointmentCard(
            //           onTap: () => Get.back(),
            //           appointmentDate: appointment.selectedDate,
            //           appointmentTime: appointment.selectedDuration,
            //           doctorName: appointment.doctorId,
            //           imagePath: 'assets/doctor01.jpeg',
            //           specialist: appointment.doctorId,
            //         );
            //       },
            //     ),
            //   ),
            // ),
            16.height,
            ListTile(
              leading: Text(
                "Doctor of the week",
                style: mediumHeaderStyle,
              ),
              trailing: Text(
                "See more",
                style: subtitleStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            // 16.height,
            SizedBox(
              height: 240,
              child: Obx(() {
                if (_doctorController.doctorsData.isEmpty) {
                  return Center(
                    child: _buildShimmerList(),
                  );
                } else {
                  return Container(
                    height: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var doctor in _doctorController.doctorsData)
                          DoctorCard(
                            imagePath: doctor.profilePic,
                            doctorName: doctor.name,
                            doctorTitle: doctor.speciality,
                            handleBook: () => Get.toNamed(
                              AppRoutes.doctor_detail,
                              arguments: {'doctor_id': doctor.uid},
                            ),
                            handleMessage: () => print("Message"),
                          ),
                      ],
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    super.key,
    this.text = "No Appointements Found for now",
    this.svgAssetUrl,
    this.width,
    this.height,
    this.noBorder = false,
  });

  final String text;
  final double? width, height;
  final String? svgAssetUrl;
  final bool noBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 280,
      width: width ?? 240,
      decoration: BoxDecoration(
        border: noBorder
            ? Border.all(
                width: 0,
                color: Colors.transparent,
              )
            : Border.all(
                width: .8,
                color: Colors.black.withOpacity(0.1),
              ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Icon(
            Icons.emergency,
            size: 52,
            color: primaryColor,
          ),
          18.height,
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
