import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/main/widgets/DateTimeCard.dart';
import 'package:medoc_patient_app/routes.dart';

class MyAppointmentScreen extends StatefulWidget {
  const MyAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<MyAppointmentScreen> createState() => _MyAppointmentScreenState();
}

enum FilterStatus { Upcoming, Complete, Cancel }

List<Map> schedules = [
  {
    'img': 'assets/doctor01.jpeg',
    'doctorName': 'Dr. Anastasya Syahid',
    'doctorTitle': 'Dental Specialist',
    'reservedDate': 'Monday, Aug 29',
    'reservedTime': '12:00PM',
    'status': FilterStatus.Upcoming,
    "package": "Messages"
  },
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Mauldya Imran',
    'doctorTitle': 'Skin Specialist',
    'reservedDate': 'Monday, Sep 29',
    'reservedTime': '11:00AM',
    'status': FilterStatus.Upcoming,
    "package": "Voice Call"
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rihanna Garland',
    'doctorTitle': 'General Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '1:00PM',
    'status': FilterStatus.Upcoming,
    "package": "Video Call"
  },
  {
    'img': 'assets/doctor04.jpeg',
    'doctorName': 'Dr. John Doe',
    'doctorTitle': 'Something Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Complete,
    "package": "On site"
  },
  {
    'img': 'assets/doctor05.jpeg',
    'doctorName': 'Dr. Sam Smithh',
    'doctorTitle': 'Other Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Cancel,
    "package": "Messages"
  },
  {
    'img': 'assets/doctor05.jpeg',
    'doctorName': 'Dr. Sam Smithh',
    'doctorTitle': 'Other Specialist',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Cancel,
    "package": "Video Call"
  },
];

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
                      onPressed: () {},
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

class _MyAppointmentScreenState extends State<MyAppointmentScreen> {
  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: scaffoldBgColor,
        title: Text(
          "My Appointment",
          style: largeHeadereStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 16.height,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Schedule',
            //       textAlign: TextAlign.start,
            //       style: mediumHeaderStyle.copyWith(
            //         fontSize: 18,
            //       ),
            //       // style: kTitleStyle.copyWith(fontSize: 18),
            //     ),
            //     // IconButton(
            //     //   onPressed: () {},
            //     //   icon: Icon(Icons.add),
            //     //   splashColor: primaryColor.withOpacity(0.5),
            //     //   style: IconButton.styleFrom(
            //     //     splashFactory: InkSplash.splashFactory,
            //     //   ),
            //     // ),
            //   ],
            // ),
            20.height,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: lightPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Upcoming) {
                                  status = FilterStatus.Upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Complete) {
                                  status = FilterStatus.Complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Cancel) {
                                  status = FilterStatus.Cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: subtitleStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                //   style:
                                //       kFilterStyle.copyWith(color: Colors.grey),
                                // ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: smallHeaderStyle.copyWith(
                          color: whiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return MyAppointmentCard(
                    doctorName: _schedule['doctorName'],
                    package: _schedule['package'],
                    status: _schedule['status'],
                    doctorImage: _schedule['img'],
                    date: _schedule['reservedDate'],
                    time: _schedule['reservedTime'],
                    icon: _schedule['package'] == "Messages"
                        ? CupertinoIcons.chat_bubble_2_fill
                        : _schedule['package'] == "Voice Call"
                            ? CupertinoIcons.phone_fill
                            : _schedule['package'] == "Video Call"
                                ? CupertinoIcons.videocam_fill
                                : Icons.home,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppointmentCard extends StatelessWidget {
  final String doctorName, package, date, time, doctorImage;
  FilterStatus status;
  final IconData icon;
  MyAppointmentCard({
    super.key,
    required this.doctorName,
    required this.package,
    required this.date,
    required this.time,
    required this.status,
    required this.doctorImage,
    required this.icon,
  });

  late FilterStatus initStatus = status;
  late String currentStatus = initStatus.toString();

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
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
                        "$package - ",
                        style: subtitleStyle,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: status == FilterStatus.Complete
                                  ? Colors.green
                                  : status == FilterStatus.Upcoming
                                      ? primaryColor
                                      : Colors.red),
                        ),
                        child: Text(
                          currentStatus.split('.').last,
                          // status.toString(),
                          style: subtitleStyle.copyWith(
                            color: status == FilterStatus.Complete
                                ? Colors.green
                                : status == FilterStatus.Upcoming
                                    ? primaryColor
                                    : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.height,
                  Text(
                    " $date | $time",
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
          status == FilterStatus.Cancel
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
                              status == FilterStatus.Upcoming
                                  ? _showBottomSheet(context)
                                  : status == FilterStatus.Complete
                                      ? Get.toNamed(
                                          AppRoutes.appointment_screen,)
                                      : print("");
                            },
                            child: status == FilterStatus.Upcoming
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
                        16.width,
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.toNamed(
                                AppRoutes.reschedule_appointment_screen_0),
                            child: status == FilterStatus.Upcoming
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
