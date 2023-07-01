import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({super.key});

  // Define a function to show the modal dialog
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
                onPressed: Get.back,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: scaffoldBgColor,
        elevation: 0,
        title: Text(
          "Review Summary",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.height,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/doctor01.jpeg",
                      height: 70,
                      // width: 100,
                    ),
                  ),
                  12.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr Jenny",
                        style: smallHeaderStyle,
                      ),
                      3.height,
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 100 * 60,
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      4.height,
                      Text(
                        'Cardiologist',
                        style: subtitleStyle,
                      ),
                      8.height,
                      Text(
                        "Christ Hospital in Douala",
                        style: subtitleStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            12.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date and Hour",
                        style: bodyStyle.copyWith(color: subtitleColor),
                      ),
                      Text(
                        "Dec 23, 2023 | 10:00AM",
                        style: bodyStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,),
                      )
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Package",
                        style: bodyStyle.copyWith(color: subtitleColor),
                      ),
                      Text(
                        "Messaging",
                        style: bodyStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,),
                      )
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Duration",
                        style: bodyStyle.copyWith(color: subtitleColor),
                      ),
                      Text(
                        "30 minutes",
                        style: bodyStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,),
                      )
                    ],
                  ),
                  8.height,
                ],
              ),
            ),
            12.height,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: bodyStyle.copyWith(color: subtitleColor),
                      ),
                      Text(
                        "1000 CFA",
                        style: bodyStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,),
                      ),
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Duration (30mins)",
                        style: bodyStyle.copyWith(color: subtitleColor),
                      ),
                      Text(
                        "1 * 1000 CFA",
                        style: bodyStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,),
                      ),
                    ],
                  ),
                  6.height,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: bodyStyle.copyWith(color: subtitleColor),
                      ),
                      Text(
                        "1000 CFA",
                        style: bodyStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 13,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            12.height,
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tileColor: whiteColor,
              contentPadding: EdgeInsets.only(left: 12, right: 7),
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/images/mtn.jpg",
                  height: 25,
                  width: 25,
                ),
              ),
              title: Text(
                "MTN",
                style: smallHeaderStyle.copyWith(fontWeight: FontWeight.w500),
              ),
              trailing: TextButton(
                onPressed: Get.back,
                child: Text("Change"),
              ),
            ),
          ],
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
            onPressed: () => _showModalDialog(context),
            child: Text(
              "Continue",
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
