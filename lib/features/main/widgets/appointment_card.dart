import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/main/widgets/schedule_card.dart';

class AppointmentCard extends StatefulWidget {
  final String doctorName, appointmentTime, appointmentDate;

  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
    required this.doctorName,
    required this.appointmentTime,
    required this.appointmentDate,
  }) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> getName;

  @override
  initState() {
    super.initState();
    getName = FirebaseFirestore.instance
        .collection("doctors")
        .doc(widget.doctorName)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      FutureBuilder(
                        future: getName,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CircleAvatar(
                              backgroundImage: AssetImage(
                                snapshot.data?.data()?['profilePic'],
                              ),
                            );
                           
                          }

                          return Container();
                        },
                      ),
                      // CircleAvatar(
                      //   backgroundImage: AssetImage(widget.imagePath),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                            future: getName,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data?.data()?['name'],
                                  style: const TextStyle(color: Colors.white),
                                );
                              }

                              return Container();
                            },
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          // FutureBuilder(
                          //   future: getName,
                          //   builder: (context, snapshot) {
                          //     if (snapshot.hasData) {
                          //       return Text(
                          //         snapshot.data?.data()?['speciality'],
                          //         style: const TextStyle(color: Colors.white),
                          //       );
                          //     }

                          //     return Container();
                          //   },
                          // ),
                          // Text(
                          //   widget.specialist,
                          //   style: subtitleStyle,
                          //   // style: TextStyle(color: Color(MyColors.text01)),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ScheduleCard(
                    appointmentDate: widget.appointmentDate,
                    appointmentTime: widget.appointmentTime,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
