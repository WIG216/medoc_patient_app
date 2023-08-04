import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medoc_patient_app/common/utils/capitalize_firstword.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/routes.dart';

class MyAppointmentCard extends StatelessWidget {
  final String doctorName, package, time, doctorImage, status;
  final IconData icon;
  final DateTime? date;
  final Function()? onAccept, reschedule;

  MyAppointmentCard({
    super.key,
    required this.doctorName,
    required this.package,
    required this.date,
    required this.time,
    required this.status,
    required this.doctorImage,
    required this.icon,
    this.onAccept,
    required this.reschedule,
  });

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 320,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              24.height,
              Text(
                "Cancel Appointment",
                style: largeHeadereStyle.copyWith(
                  color: Colors.red,
                ),
              ),
              12.height,
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
              ),
              12.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Are you sure you want to cancel your appointment?",
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              12.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Only 50% of the funds will be returned to your account.",
                  textAlign: TextAlign.center,
                  style: bodyStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              12.height,
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
              ),
              12.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: Get.back,
                        child: Text("Back"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    16.width,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onAccept,
                        child: Text("Yes, Cancel"),
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
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('E d MMMM yyyy').format(date!);
    String formattedPackage = capitalizeFirstLetter(package.split('.').last);
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  doctorImage,
                  height: 80,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: bodyStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.height,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$formattedPackage - ",
                        style: subtitleStyle,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: status == "Completed"
                                ? Colors.green
                                : status == "Upcoming"
                                    ? primaryColor
                                    : Colors.red,
                          ),
                        ),
                        child: Text(
                          status,
                          // status.toString(),
                          style: subtitleStyle.copyWith(
                            color: status == "Completed"
                                ? Colors.green
                                : status == "Upcoming"
                                    ? primaryColor
                                    : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.height,
                  Text(
                    " $formattedDate | $time minutes",
                    style: subtitleStyle,
                  ),
                ],
              ),
              // 24.width,
              CircleAvatar(
                backgroundColor: lightBgColor.withOpacity(0.2),
                child: Icon(
                  icon,
                  color: primaryColor,
                ),
              )
            ],
          ),
          8.height,
          status == "Canceled"
              ? SizedBox()
              : Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(218, 189, 189, 189),
                      ),
                    ),
                    8.height,
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              status == "Upcoming"
                                  ? _showBottomSheet(context)
                                  : status == "Completed"
                                      ? Get.toNamed(
                                          AppRoutes.review,
                                        )
                                      : print("");
                            },
                            child: status == "Upcoming"
                                ? Text(
                                    "Cancel Appointment",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                : Text("Book Again"),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        12.width,
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              status == "Upcoming"
                                  ? reschedule?.call()
                                  : status == "Completed"
                                      ? Get.toNamed(
                                          AppRoutes.review,
                                        )
                                      : print("=====================");
                            },
                            // onPressed: reschedule,
                            child: status == "Upcoming"
                                ? Text("Reschedule")
                                : Text("Leave a Review"),
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
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
