import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:medoc_patient_app/common/utils/capitalize_word.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/common/widgets/custom_appbar.dart';
import 'package:medoc_patient_app/common/widgets/custom_icon_button.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/doctor/controllers/doctor_controller.dart';
import 'package:medoc_patient_app/routes.dart';

class ViewAppointment extends StatefulWidget {
  const ViewAppointment({super.key});

  @override
  State<ViewAppointment> createState() => _ViewAppointmentState();
}

class _ViewAppointmentState extends State<ViewAppointment> {
  BookingController _bookingController = Get.find();
  DoctorController _doctorController = Get.find();

  void _showModalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          surfaceTintColor: Colors.red,
          icon: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: 80,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      // color: Color(0xFFf0f0f1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Lottie.asset(
                      'assets/lottiefiles/27315-appointment-booking-with-smartphone.zip',
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          title: Text(
            "Congratulations!",
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 8.height,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Appointment successivefly booked. You will recieve a notification and the doctor you selected will cantact you.",
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.grey,
                      // fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSubmit,
                // onPressed: (){Navigator.of(context).pop();},
                child: Text(
                  "View Appointment",
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
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: Get.back,
                // onPressed: (){Navigator.of(context).pop();},
                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: OutlinedButton.styleFrom(
                  primary: primaryColor,
                  // onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showModalDialogOnError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          surfaceTintColor: Colors.red,
          icon: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // width: 80,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      // color: Color(0xFFf0f0f1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Lottie.asset(
                      'assets/lottiefiles/135746-online-appointment-crm.zip',
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          ),
          title: Text(
            "Oops. Failed!",
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 8.height,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Appointment failed. Please check your internet connection then try again",
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.grey,
                      // fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: Get.back,
                // onPressed: (){Navigator.of(context).pop();},
                child: Text(
                  "Try Again",
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
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: Get.back,
                // onPressed: (){Navigator.of(context).pop();},
                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: OutlinedButton.styleFrom(
                  primary: primaryColor,
                  // onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // BookingController _bookingController = Get.find();

  onSubmit() {
    _bookingController.createAppointment(
      context: context,
      doctorId: _bookingController.doctorId.value,
      selectedDuration: _bookingController.selectedDuration.value,
      selectedDate: _bookingController.selectedDate.value!,
      selectedPackage: _bookingController.selectedPackage.value.toString(),
      selectedPayment: _bookingController.selectedPayment.value.toString(),
      time: _bookingController.choosenTime.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final doctorId = _bookingController.doctorId.value;

    final doctor =
        _doctorController.doctorsData.firstWhere((p) => p.uid == doctorId);

    String formattedDate = DateFormat('EEEE MMM dd yyyy')
        .format(_bookingController.selectedDate.value!);

    String payment = _bookingController.selectedPayment.value.toString();
    String paymentMethod = payment.split(".").last;

    String package = _bookingController.selectedPackage.value.toString();
    String selectedPackage = package.split(".").last;

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
                      doctor.name,
                      style: mediumHeaderStyle,
                    ),
                    4.height,
                    Text(
                      doctor.speciality,
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
                            Text(doctor.address, style: subtitleStyle),
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
              "$formattedDate | ${_bookingController.choosenTime}",
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
              _bookingController.patientProblem.value,
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
                "Selected Package",
                style: subtitleStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Text(
                capitalize(selectedPackage),
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
                "Consultation",
                style: subtitleStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Text(
                selectedPackage == 'messages'
                    ? '1000 CFA'
                    : selectedPackage == "videoCall"
                        ? "2000 CFA"
                        : selectedPackage == "voiceCall"
                            ? "1200 CFA"
                            : "3000 CFA",
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
                selectedPackage == 'messages'
                    ? '50 CFA'
                    : selectedPackage == "videoCall"
                        ? "100 CFA"
                        : selectedPackage == "voiceCall"
                            ? "75 CFA"
                            : "200 CFA",
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
                selectedPackage == 'messages'
                    ? '1050 CFA'
                    : selectedPackage == "videoCall"
                        ? "2100 CFA"
                        : selectedPackage == "voiceCall"
                            ? "1275 CFA"
                            : "3200 CFA",
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
                  capitalize(paymentMethod),
                  style: smallHeaderStyle,
                ),
                SizedBox(
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.payment);
                    },
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
                onPressed: () => _showModalDialog(context),
                child: Text(
                  "Book Appointment",
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
