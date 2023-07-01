import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/enum/appointment_period.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/main/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/features/main/widgets/period_tab.dart';

class Appointment extends StatefulWidget {
  Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

List<Map> period = [
  {
    "time": "9:00AM",
    "icon": Icons.sunny,
    "status": FilterStatus.Morning,
  },
  {
    "time": "9:30AM",
    "icon": Icons.sunny,
    "status": FilterStatus.Morning,
  },
  {
    "time": "10:00AM",
    "icon": Icons.sunny,
    "status": FilterStatus.Morning,
  },
  {
    "time": "10:30AM",
    "icon": Icons.sunny,
    "status": FilterStatus.Morning,
  },
  {
    "time": "11:00AM",
    "icon": Icons.sunny,
    "status": FilterStatus.Morning,
  },
  {
    "time": "4:30PM",
    "icon": CupertinoIcons.cloud_sun_fill,
    "status": FilterStatus.Evening,
  },
  {
    "time": "5:00PM",
    "icon": CupertinoIcons.cloud_sun_fill,
    "status": FilterStatus.Evening,
  },
  {
    "time": "5:30PM",
    "icon": CupertinoIcons.cloud_sun_fill,
    "status": FilterStatus.Evening,
  },
  {
    "time": "6:00PM",
    "icon": CupertinoIcons.cloud_sun_fill,
    "status": FilterStatus.Evening,
  },
];

class _AppointmentState extends State<Appointment> {
  AppointmentController _appointmentController = Get.find();

  bool isClicked = false;
  final List categories = [
    {
      "title": "Voice call",
      'subtitle': "Can make a voice call with doctor.",
      "icon": Icons.phone,
      "trailing": "1000 CFA",
    },
    {
      "title": "Messaging",
      'subtitle': "Can make messaging with doctor.",
      "icon": CupertinoIcons.chat_bubble_2_fill,
      "trailing": "500 CFA",
    },
    {
      "title": "video call",
      'subtitle': "Can make a video call with doctor.",
      "icon": CupertinoIcons.videocam_fill,
      "trailing": "1500 CFA",
    },
    {
      "title": "House visite",
      'subtitle': "Doctor comes to your location",
      "icon": CupertinoIcons.home,
      "trailing": "2000 CFA",
    },
  ];

  Alignment _alignment = Alignment.centerLeft;
  late var status = _appointmentController.status.value;

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
                      color: Color(0xFFf0f0f1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      CupertinoIcons.house_fill,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                right: 100,
                child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.content_paste_go_rounded,
                      size: 15,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          title: Text(
            "Completed",
            style: TextStyle(
              color: Colors.black54,
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
                    text: "Your appointment booking successfully completed. ",
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.grey,
                      // fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Dr. Jane Cooper ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "will contact you soon")
                    ],
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
                  "Contact Doctor",
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
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = period.where((var period) {
      return period['status'] == _appointmentController.status.value;
    }).toList();
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        title: Text(
          "Appointment",
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
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Obx(() {
          return ListView(
            children: [
              8.height,
              Text(
                "10 June, Monday",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              12.height,
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    // padding: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: scaffoldBgColor,
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
                                  if (filterStatus == FilterStatus.Morning) {
                                    status = FilterStatus.Morning;
                                    _appointmentController.updateStatus(status);
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterStatus ==
                                      FilterStatus.Evening) {
                                    status = FilterStatus.Evening;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Align(
                                alignment: filterStatus.name == "Morning"
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Container(
                                  width: 160,
                                  padding: EdgeInsets.all(12),
                                  // margin: EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFf0f0f1),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Icon(
                                            filterStatus.name == "Morning"
                                                ? Icons.sunny
                                                : CupertinoIcons.cloud_sun_fill,
                                            color: Color(0xFF9c9fb0)),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        filterStatus.name,
                                        style:
                                            TextStyle(color: Color(0xFFc4c6d0)),
                                      ),
                                    ],
                                  ),

                                  // child: Center(
                                  //   child: Text(
                                  //     filterStatus.name,
                                  //     style: subtitleStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold,),
                                  //   //   style:
                                  //   //       kFilterStyle.copyWith(color: Colors.grey),
                                  //   // ),
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
                      width: 160,
                      // height: 40,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isClicked ? Color(0xFFFFFFFF) : primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  status.name == "Morning"
                                      ? Icons.sunny
                                      : CupertinoIcons.cloud_sun_fill,
                                  color: primaryColor,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                status.name,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // child: Center(
                      //   child: Text(status.name,
                      //       style: smallHeaderStyle.copyWith(
                      //           color: whiteColor, fontSize: 14)),
                      // ),
                    ),
                  )
                ],
              ),

              // 12.height,

              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: ClickableContainer(
              //         icon: Icons.sunny,
              //         text: "Morning",
              //       ),
              //     ),
              //     20.width,
              //     Expanded(
              //       child: ClickableContainer(
              //         icon: CupertinoIcons.cloud_sun_fill,
              //         text: "Evening",
              //       ),
              //     ),
              //   ],
              // ),
              // 16.height,

              SelectTimeList(),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SelectTime(
              //       time: "9:00AM",
              //     ),
              //     SelectTime(
              //       time: "9:30AM",
              //     ),
              //     SelectTime(
              //       time: "10:00AM",
              //     ),

              //     SelectTime(
              //       time: "10:30AM",
              //     ),

              //   ],
              // ),
              30.height,
              // ClickableContainer(),
              Text(
                "Fees information",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              8.height,
              for (var category in categories)
                ClickableListTile(
                  title: category['title'],
                  subtitle: category['subtitle'],
                  trailing: category['trailing'],
                  icon: category['icon'],
                )
            ],
          );
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 40,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () => _appointmentController.onSubmit(),
            child: Text(
              "Pay Now",
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

class ClickableListTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;

  const ClickableListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  _ClickableListTileState createState() => _ClickableListTileState();
}

class _ClickableListTileState extends State<ClickableListTile> {
  AppointmentController _appointmentController = Get.find();
  bool isClicked = false;
  List<Map<String, dynamic>> feesInfo = [];
  // List<Map<String, dynamic>> clickedItems = [];

//   void addAllItemsToClickedItems() {
//   clickedItems = List<Map<String, dynamic>>.from(feesInfo);
//   print(clickedItems);
// }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;

          if (isClicked) {
            feesInfo.add({
              'title': widget.title,
              'trailing': widget.trailing,
            });
            _appointmentController.updatedFeesInformation(feesInfo);
          } else {
            feesInfo.removeWhere((item) => item['title'] == widget.title);
            _appointmentController.updatedFeesInformation(feesInfo);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isClicked ? primaryColor.withOpacity(0.5) : Colors.transparent,
            width: 2,
          ),
        ),
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFf0f0f1),
            ),
            child: Icon(
              widget.icon,
              color: primaryColor,
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            widget.subtitle,
            style: TextStyle(
              fontSize: 11,
              color: Color(0xFFc4c6d0),
            ),
          ),
          trailing: Text(
            widget.trailing,
            style: TextStyle(
              color: primaryColor,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class ClickableContainer extends StatefulWidget {
  final IconData icon;
  final String text;

  const ClickableContainer({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _ClickableContainerState createState() => _ClickableContainerState();
}

class _ClickableContainerState extends State<ClickableContainer> {
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isClicked ? Color(0xFFFFFFFF) : primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isClicked ? Color(0xFFf0f0f1) : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                color: isClicked ? Color(0xFF9c9fb0) : primaryColor,
              ),
            ),
            SizedBox(width: 12),
            Text(
              widget.text,
              style: TextStyle(
                color: isClicked ? Color(0xFFc4c6d0) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTimeList extends StatefulWidget {
  @override
  _SelectTimeListState createState() => _SelectTimeListState();
}

class _SelectTimeListState extends State<SelectTimeList> {
  AppointmentController _appointmentController = Get.find();

  late String activeTime = _appointmentController.activeTime.value;
  // @override
  // void initState() {
  //   super.initState();
  //   activeTime = "9:00AM";
  // }
  List<Map> period = [
    {
      "time": "9:00AM",
      "icon": Icons.sunny,
      "status": FilterStatus.Morning,
    },
    {
      "time": "9:30AM",
      "icon": Icons.sunny,
      "status": FilterStatus.Morning,
    },
    {
      "time": "10:00AM",
      "icon": Icons.sunny,
      "status": FilterStatus.Morning,
    },
    {
      "time": "10:30AM",
      "icon": Icons.sunny,
      "status": FilterStatus.Morning,
    },
    {
      "time": "11:00AM",
      "icon": Icons.sunny,
      "status": FilterStatus.Morning,
    },
    {
      "time": "4:30PM",
      "icon": CupertinoIcons.cloud_sun_fill,
      "status": FilterStatus.Evening,
    },
    {
      "time": "5:00PM",
      "icon": CupertinoIcons.cloud_sun_fill,
      "status": FilterStatus.Evening,
    },
    {
      "time": "5:30PM",
      "icon": CupertinoIcons.cloud_sun_fill,
      "status": FilterStatus.Evening,
    },
    {
      "time": "6:00PM",
      "icon": CupertinoIcons.cloud_sun_fill,
      "status": FilterStatus.Evening,
    },
  ];
  late FilterStatus status = _appointmentController.status.value;

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = period.where((var period) {
      return period['status'] == status;
    }).toList();
    return SizedBox(
      height: 50,
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemCount: filteredSchedules.length,
          itemBuilder: (context, index) {
            var _schedule = filteredSchedules[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectTime(
                  time: _schedule["time"],
                  isActive: activeTime == _schedule["time"],
                  onTap: () {
                    setState(() {
                      activeTime = _schedule["time"];
                    });
                    _appointmentController.updateActiveTime(activeTime);
                  },
                ),
              ],
            );
          }),
    );
  }
}

class SelectTime extends StatefulWidget {
  final String time;
  final bool isActive;
  final VoidCallback onTap;

  const SelectTime({
    required this.time,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        // height: 40,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: widget.isActive ? Color(0xFFf9f9fa) : whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: widget.isActive ? primaryColor : Color(0xFFc4c6d0),
            width: 1.5,
          ),
        ),
        child: Text(
          widget.time,
          style: TextStyle(
            color: widget.isActive ? primaryColor : Color(0xFFc4c6d0),
          ),
        ),
      ),
    );
  }
}
