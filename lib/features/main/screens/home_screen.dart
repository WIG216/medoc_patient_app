import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/main/widgets/action_card.dart';
import 'package:medoc_patient_app/features/main/widgets/appointment_card.dart';
import 'package:medoc_patient_app/features/main/widgets/category_icon.dart';
import 'package:medoc_patient_app/features/main/widgets/doctor_card.dart';
import 'package:medoc_patient_app/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Map> doctors = [
    {
      'img': 'assets/doctor02.png',
      'doctorName': 'Dr. Gardner Pearson',
      'doctorTitle': 'Heart Specialist'
    },
    {
      'img': 'assets/doctor03.jpeg',
      'doctorName': 'Dr. Rosa Williamson',
      'doctorTitle': 'Skin Specialist'
    },
    {
      'img': 'assets/doctor02.png',
      'doctorName': 'Dr. Gardner Pearson',
      'doctorTitle': 'Heart Specialist'
    },
    {
      'img': 'assets/doctor03.jpeg',
      'doctorName': 'Dr. Rosa Williamson',
      'doctorTitle': 'Skin Specialist'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: ListTile(
          contentPadding: EdgeInsets.only(
            bottom: 8,
          ),
          leading: CircleAvatar(
            backgroundColor: lightBgColor.withOpacity(0.2),
            radius: 20,
            child: Icon(
              Icons.health_and_safety_outlined,
              color: whiteColor,
            ),
          ),
          title: Text(
            "Welcome back!",
            style:
                TextStyle(color: whiteColor.withOpacity(0.8), fontSize: 13),
          ),
          subtitle: Text(
            "Ashley Octavia",
            style: smallHeaderStyle.copyWith(color: whiteColor,),
          ),
          trailing: Icon(
            Icons.notifications,
            color: whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.height,
            // Container(
            //   margin: EdgeInsets.symmetric(
            //     horizontal: 12,
            //   ),
            //   padding: EdgeInsets.symmetric(
            //     // horizontal: 12,
            //     vertical: 16,
            //   ),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     color: whiteColor,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Color(0xFFE4E3E3),
            //         blurRadius: 6.0,
            //         spreadRadius: 1.0,
            //         offset: Offset(0.0, 1.0),
            //       )
            //     ],
            //   ),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           ActionCard(
            //             text: "Emergency",
            //             icon: Icons.notifications_active,
            //             onTap: () => print("onTap"),
            //           ),
            //           ActionCard(
            //             text: "Telemedicine",
            //             icon: Icons.phone_forwarded,
            //             onTap: () => print("onTap"),
            //           ),
            //           ActionCard(
            //             text: "Bed aviability",
            //             icon: Icons.bed,
            //             onTap: () => print("onTap"),
            //           ),
            //         ],
            //       ),
            //       24.height,
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           ActionCard(
            //             text: "Doctors",
            //             icon: Icons.person_2,
            //             onTap: () => print("onTap"),
            //           ),
            //           ActionCard(
            //             text: "Covid-19",
            //             icon: Icons.coronavirus,
            //             onTap: () => print("onTap"),
            //           ),
            //           ActionCard(
            //             text: "More",
            //             icon: Icons.category,
            //             onTap: () => print("onTap"),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
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
              // trailing: Text(
              //   "See more",
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 14,
              //   ),
              // ),
              trailing: TextButton(
                onPressed: () => Get.toNamed(AppRoutes.appointments),
                child: Text(
                  "See more",
                  style: subtitleStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: AppointmentCard(onTap: () => Get.back()),
            ),
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
            Container(
              height: 235,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  for (var doctor in doctors)
                    DoctorCard(
                      imagePath: doctor['img'],
                      doctorName: doctor['doctorName'],
                      doctorTitle: doctor['doctorTitle'],
                      handleBook: () => Get.toNamed(AppRoutes.doctor_detail),
                      handleMessage: () => print("Message"),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
