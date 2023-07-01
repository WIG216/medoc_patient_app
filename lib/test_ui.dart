import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

class DoctorAppointmentScreen extends StatefulWidget {
  const DoctorAppointmentScreen({super.key});

  @override
  State<DoctorAppointmentScreen> createState() =>
      _DoctorAppointmentScreenState();
}

class _DoctorAppointmentScreenState extends State<DoctorAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: scaffoldBgColor,
        elevation: 0,
        title: Text(
          "My Appointment",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                        6.height,
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
              24.height,
              Text(
                "Scheduled Appointment",
                style: mediumHeaderStyle,
              ),
              12.height,
              Text(
                "Today, Decenber 22, 2022",
                style: subtitleStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              8.height,
              Text(
                "16:00 - 16:30 PM (30 minutes)",
                style: subtitleStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              24.height,
              Text(
                "Patient Information",
                style: mediumHeaderStyle,
              ),
              8.height,
              Text(
                "Full Name: Andrew Doe",
                style: subtitleStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              8.height,
              Text(
                "Gender: Male",
                style: subtitleStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              8.height,
              Text(
                "Age: 20",
                style: subtitleStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              8.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Problem :",
                    style: subtitleStyle.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  4.width,
                  SizedBox(
                    width: 300,
                    child: ReadMoreText(
                      text:
                          "Anxiety and depression. The pressures of academic performance, social interactions, and the challenges of transitioning into adulthood can contribute to mental health struggles in young people. ",
                      // maxLines: 2,
                    ),
                  ),
                ],
              ),
              24.height,
              Text(
                "Your Package",
                style: mediumHeaderStyle,
              ),
              8.height,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: whiteColor,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: lightBgColor.withOpacity(.2),
                    radius: 20,
                    child: Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                      color: primaryColor,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Messaging",
                        style: smallHeaderStyle,
                      ),
                      Text(
                        "1000 CFA",
                        style: smallHeaderStyle.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chat messages with doctor",
                        style: subtitleStyle,
                      ),
                      Text(
                        "paid out",
                        style: subtitleStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
            onPressed: () {},
            child: Text(
              "Messages (Start at 16:00PM)",
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

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;

  ReadMoreText({required this.text, this.maxLines = 3});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textSpan = TextSpan(
          text: widget.text,
          style: TextStyle(
              color: subtitleColor,
              height: 1.5,
              overflow: TextOverflow.ellipsis),
        );
        TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);

        if (textPainter.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                maxLines: isExpanded ? null : widget.maxLines,
                text: textSpan,
                // overflow: TextOverflow.ellipsis,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'View less' : 'View more',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        } else {
          return RichText(
            text: textSpan,
          );
        }
      },
    );
  }
}
