/* // import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medoc_patient_app/common/utils/colors.dart';
// import 'package:medoc_patient_app/common/utils/gap.dart';
// import 'package:medoc_patient_app/common/utils/text_style.dart';

// class DoctorAppointmentScreen extends StatefulWidget {
//   const DoctorAppointmentScreen({super.key});

//   @override
//   State<DoctorAppointmentScreen> createState() =>
//       _DoctorAppointmentScreenState();
// }

// class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: scaffoldBgColor,
//       appBar: AppBar(
//         backgroundColor: scaffoldBgColor,
//         elevation: 0,
//         title: Text(
//           "My Appointment",
//           style: TextStyle(
//             color: Colors.black54,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         leading: Container(
//           margin: EdgeInsets.symmetric(
//             horizontal: 10,
//             vertical: 10,
//           ),
//           child: OutlinedButton(
//             onPressed: Get.back,
//             style: OutlinedButton.styleFrom(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 0,
//                 vertical: 0,
//               ),
//               side: BorderSide(color: Colors.black45),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.black45,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               24.height,
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 10,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: whiteColor,
//                 ),
//                 child: Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(
//                         "assets/doctor01.jpeg",
//                         height: 70,
//                         // width: 100,
//                       ),
//                     ),
//                     12.width,
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Dr Jenny",
//                           style: smallHeaderStyle,
//                         ),
//                         3.height,
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width / 100 * 60,
//                           child: Divider(
//                             thickness: 0.5,
//                             color: Colors.grey[400],
//                           ),
//                         ),
//                         6.height,
//                         Text(
//                           'Cardiologist',
//                           style: subtitleStyle,
//                         ),
//                         8.height,
//                         Text(
//                           "Christ Hospital in Douala",
//                           style: subtitleStyle,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               24.height,
//               Text(
//                 "Scheduled Appointment",
//                 style: mediumHeaderStyle,
//               ),
//               12.height,
//               Text(
//                 "Today, Decenber 22, 2022",
//                 style: subtitleStyle.copyWith(
//                   fontSize: 13,
//                 ),
//               ),
//               8.height,
//               Text(
//                 "16:00 - 16:30 PM (30 minutes)",
//                 style: subtitleStyle.copyWith(
//                   fontSize: 13,
//                 ),
//               ),
//               24.height,
//               Text(
//                 "Patient Information",
//                 style: mediumHeaderStyle,
//               ),
//               8.height,
//               Text(
//                 "Full Name: Andrew Doe",
//                 style: subtitleStyle.copyWith(
//                   fontSize: 13,
//                 ),
//               ),
//               8.height,
//               Text(
//                 "Gender: Male",
//                 style: subtitleStyle.copyWith(
//                   fontSize: 13,
//                 ),
//               ),
//               8.height,
//               Text(
//                 "Age: 20",
//                 style: subtitleStyle.copyWith(
//                   fontSize: 13,
//                 ),
//               ),
//               8.height,
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Problem :",
//                     style: subtitleStyle.copyWith(
//                       fontSize: 13,
//                     ),
//                   ),
//                   4.width,
//                   SizedBox(
//                     width: 300,
//                     child: ReadMoreText(
//                       text:
//                           "Anxiety and depression. The pressures of academic performance, social interactions, and the challenges of transitioning into adulthood can contribute to mental health struggles in young people. ",
//                       // maxLines: 2,
//                     ),
//                   ),
//                 ],
//               ),
//               24.height,
//               Text(
//                 "Your Package",
//                 style: mediumHeaderStyle,
//               ),
//               8.height,
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: whiteColor,
//                 ),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: lightBgColor.withOpacity(.2),
//                     radius: 20,
//                     child: Icon(
//                       CupertinoIcons.chat_bubble_2_fill,
//                       color: primaryColor,
//                     ),
//                   ),
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Messaging",
//                         style: smallHeaderStyle,
//                       ),
//                       Text(
//                         "1000 CFA",
//                         style: smallHeaderStyle.copyWith(
//                           color: primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Chat messages with doctor",
//                         style: subtitleStyle,
//                       ),
//                       Text(
//                         "paid out",
//                         style: subtitleStyle,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 12.0,
//           vertical: 20,
//         ),
//         child: SizedBox(
//           height: 50,
//           child: ElevatedButton(
//             onPressed: () {},
//             child: Text(
//               "Messages (Start at 16:00PM)",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//             ),
//             style: ElevatedButton.styleFrom(
//               primary: primaryColor,
//               onPrimary: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ReadMoreText extends StatefulWidget {
//   final String text;
//   final int maxLines;

//   ReadMoreText({required this.text, this.maxLines = 3});

//   @override
//   _ReadMoreTextState createState() => _ReadMoreTextState();
// }

// class _ReadMoreTextState extends State<ReadMoreText> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         final textSpan = TextSpan(
//           text: widget.text,
//           style: TextStyle(
//               color: subtitleColor,
//               height: 1.5,
//               overflow: TextOverflow.ellipsis),
//         );
//         TextPainter textPainter = TextPainter(
//           text: textSpan,
//           maxLines: widget.maxLines,
//           textDirection: TextDirection.ltr,
//         );
//         textPainter.layout(maxWidth: constraints.maxWidth);

//         if (textPainter.didExceedMaxLines) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               RichText(
//                 maxLines: isExpanded ? null : widget.maxLines,
//                 text: textSpan,
//                 // overflow: TextOverflow.ellipsis,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isExpanded = !isExpanded;
//                   });
//                 },
//                 child: Text(
//                   isExpanded ? 'View less' : 'View more',
//                   style: TextStyle(
//                     color: primaryColor,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         } else {
//           return RichText(
//             text: textSpan,
//           );
//         }
//       },
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/common/widgets/custom_appbar.dart';
import 'package:medoc_patient_app/common/widgets/custom_elevated_button.dart';
import 'package:medoc_patient_app/common/widgets/custom_icon_button.dart';

class ViewAppointment extends StatefulWidget {
  const ViewAppointment({super.key});

  @override
  State<ViewAppointment> createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Appointment"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          18.height,
          Row(
            children: [
              Container(
                height: 100,
                width: 120,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: lightBgColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    "assets/doctor01.jpeg",
                  ),
                ),
              ),
              20.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Geek",
                      style: mediumHeaderStyle,
                    ),
                    4.height,
                    Text(
                      "Orthophoniste",
                      style: subtitleStyle,
                    ),
                    6.height,
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: lightBgColor.withOpacity(.2),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: primaryColor,
                                size: 14,
                              ),
                              Text(
                                "4.2",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        12.width,
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: subtitleColor,
                              size: 14,
                            ),
                            2.width,
                            Text("ISTAMA", style: subtitleStyle),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          24.height,
          Text(
            "Date",
            style: mediumHeaderStyle,
          ),
          // 8.height,
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 1),
            leading: CircleAvatar(
              backgroundColor: lightBgColor.withOpacity(.2),
              radius: 18,
              child: Icon(
                CupertinoIcons.calendar,
                size: 18,
                color: primaryColor,
              ),
            ),
            title: Text(
              "Friday Feb 05 2023 | 01:00PM",
              style: bodyStyle.copyWith(color: subtitleColor),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          12.height,
          Text(
            "Reason",
            style: mediumHeaderStyle,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 1),
            leading: CircleAvatar(
              backgroundColor: lightBgColor.withOpacity(.2),
              radius: 18,
              child: Icon(
                Icons.history_edu_outlined,
                size: 24,
                color: primaryColor,
              ),
            ),
            title: Text(
              "Chest Pain",
              style: bodyStyle.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          12.height,
          Text(
            "Payment Detail",
            style: mediumHeaderStyle,
          ),
          SizedBox(
            height: 20,
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 1),
              leading: Text(
                "Consultation",
                style: subtitleStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Text(
                "1000 CFA",
                style: bodyStyle,
              ),
            ),
          ),
          8.height,
          SizedBox(
            height: 20,
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 1),
              leading: Text(
                "Admin Fee",
                style: subtitleStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Text(
                "50 CFA",
                style: bodyStyle,
              ),
            ),
          ),
          8.height,

          SizedBox(
            height: 20,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 1,
                vertical: 0,
              ),
              leading: Text(
                "Additional Discount",
                style: subtitleStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Text(
                "-",
                style: bodyStyle,
              ),
            ),
          ),
          8.height,
          SizedBox(
            height: 20,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 1,
                vertical: 0,
              ),
              leading: Text(
                "Total",
                style: subtitleStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "1050 CFA",
                style: bodyStyle.copyWith(color: primaryColor),
              ),
            ),
          ),
          26.height,
          SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey[300],
            ),
          ),
          12.height,
          Text(
            "Payment Method",
            style: mediumHeaderStyle,
          ),
          12.height,
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey[300]!,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MTN",
                  style: smallHeaderStyle,
                ),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change",
                      style: subtitleStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomIconButton(
                icon: Icons.delete,
              ),
            ),
            8.width,
            Expanded(
              flex: 5,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Booking",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/appointment/widgets/my_appointment_card.dart';
import 'package:medoc_patient_app/models/appointment_model.dart';
import 'package:medoc_patient_app/models/doctor_model.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:shimmer/shimmer.dart';

class MyAppointmentsScreen extends StatefulWidget {
  @override
  _MyAppointmentsScreenState createState() => _MyAppointmentsScreenState();
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    // print(appointmentController.appointmentData.toJson());

    return Scaffold(
      backgroundColor: scaffoldBgColor,
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
      body: TabBarView(
        controller: _tabController,
        children: [
          Obx(() {
            if (appointmentController.upcomingAppointments.isEmpty) {
              return Center(
                child: _buildShimmerList(),
              );
            } else {
              final List<Appointment> upcomingAppointments =
                  appointmentController.upcomingAppointments;
              return buildAppointmentList(upcomingAppointments);
            }
          }),
          Obx(() {
            if (appointmentController.completedAppointments.isEmpty) {
              return Center(
                child: _buildShimmerList(),
              );
            } else {
              final List<Appointment> completedAppointments =
                  appointmentController.completedAppointments;
              return buildAppointmentList(completedAppointments);
            }
          }),
          Obx(() {
            if (appointmentController.canceledAppointments.isEmpty) {
              return Center(
                child: _buildShimmerList(),
              );
            } else {
              final List<Appointment> canceledAppointments =
                  appointmentController.canceledAppointments;
              return buildAppointmentList(canceledAppointments);
            }
          }),
        ],
      ),
    );
  }

  Widget buildAppointmentList(List<Appointment> appointments) {
    // final appointmentts = appointmentController.appointmentList;

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
            onAccept: () {
              appointmentController.updateAppointmentStatus(
                appointment,
                "Canceled",
              );
              Get.back();
            },
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
}

class UpcomingAppointement extends StatefulWidget {
  const UpcomingAppointement({super.key});

  @override
  State<UpcomingAppointement> createState() => _UpcomingAppointementState();
}

class _UpcomingAppointementState extends State<UpcomingAppointement> {
  final controller = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: controller.appointmentRepository.getAppointmentsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }

          if (snapshot.hasData) {
            final List<Appointment> retrievedAppointments =
                snapshot.data!.docs.map((doc) {
              return Appointment.fromMap(doc.data() as Map<String, dynamic>);
            }).toList();

            if (retrievedAppointments.isEmpty) {
              return Container();
            }

            return buildAppointmentList(retrievedAppointments);
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
}



class TestingAppScreen extends StatefulWidget {
  @override
  _TestingAppScreenState createState() => _TestingAppScreenState();
}

class _TestingAppScreenState extends State<TestingAppScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final BookingController appointmentController = Get.put(BookingController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    // print(appointmentController.appointmentData.toJson());

    return Scaffold(
      backgroundColor: scaffoldBgColor,
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
      body: TabBarView(
        controller: _tabController,
        children: [
          MyAppointmentsScreen(),
          Obx(() {
            if (appointmentController.completedAppointments.isEmpty) {
              return Center(
                child: _buildShimmerList(),
              );
            } else {
              final List<Appointment> completedAppointments =
                  appointmentController.completedAppointments;
              return buildAppointmentList(completedAppointments);
            }
          }),
          Obx(() {
            if (appointmentController.canceledAppointments.isEmpty) {
              return Center(
                child: _buildShimmerList(),
              );
            } else {
              final List<Appointment> canceledAppointments =
                  appointmentController.canceledAppointments;
              return buildAppointmentList(canceledAppointments);
            }
          }),
        ],
      ),
    );
  }

  Widget buildAppointmentList(List<Appointment> appointments) {
    // final appointmentts = appointmentController.appointmentList;

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
            onAccept: () {
              appointmentController.updateAppointmentStatus(
                appointment,
                "Canceled",
              );
              Get.back();
            },
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
}
 */