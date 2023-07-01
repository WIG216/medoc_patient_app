import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/enum/reschedule_appointment_reason.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/appointment/screens/payment_screen.dart';
import 'package:medoc_patient_app/features/main/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';


class RescheduleAppointmentFirstScreen extends StatefulWidget {
  const RescheduleAppointmentFirstScreen({super.key});

  @override
  State<RescheduleAppointmentFirstScreen> createState() =>
      _RescheduleAppointmentFirstScreenState();
}

class _RescheduleAppointmentFirstScreenState
    extends State<RescheduleAppointmentFirstScreen> {
  BookingController _bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Reschedule Appointment",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: OutlinedButton(
            onPressed: Get.back,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              side: BorderSide(color: Colors.black45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Obx(
           () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.height,
                Text(
                  "Reason for Schedule Change",
                  style: smallHeaderStyle,
                ),
                12.height,
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: rescheduleReasons.length,
                    itemBuilder: (context, index) {
                      final rescheduleReasonOption = rescheduleReasons[index];
                      // print(paymentOption['image']);
                      return RescheduleReasonCard(
                        title: rescheduleReasonOption['title'],
                        value: rescheduleReasonOption['value'],
                      );
                    },
                  ),
                ),
                12.height,
                _bookingController.selectedRescheduleReason.value != RescheduleReason.others
                    ? SizedBox()
                    : TextField(
                        // controller: problemController,
                        maxLines: 10,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type your reason',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor.withOpacity(0.4),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
              ],
            );
          }
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 20,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.reschedule_appointment_screen),
            child: Text(
              "Next",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
      ),
    );
  }
}

class RescheduleReasonCard extends StatefulWidget {
  final RescheduleReason value;
  final String title;
  const RescheduleReasonCard(
      {super.key, required this.value, required this.title});

  @override
  State<RescheduleReasonCard> createState() => _RescheduleReasonCardState();
}

class _RescheduleReasonCardState extends State<RescheduleReasonCard> {
  BookingController _bookingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Radio<RescheduleReason>(
            value: widget.value,
            groupValue: _bookingController.selectedRescheduleReason.value,
            onChanged: (RescheduleReason? value) {
              _bookingController.selectRescheduleReason(value);
            },
          ),
        ),
        // 16.width,
        Text(
          widget.title,
          style: bodyStyle,
        ),
      ],
    );
  }
}

List rescheduleReasons = [
  {
    "title": "I'm having a sechedule clash",
    "value": RescheduleReason.scheduleClash,
  },
  {
    "title": "I'm not avialable on schedule",
    "value": RescheduleReason.available,
  },
  {
    "title": "I have an activity that can't be left behind",
    "value": RescheduleReason.activity,
  },
  {
    "title": "I don't want to tell",
    "value": RescheduleReason.private,
  },
  {
    "title": "Others",
    "value": RescheduleReason.others,
  },
];
