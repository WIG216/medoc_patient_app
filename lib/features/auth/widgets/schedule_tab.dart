// import 'package:flutter/material.dart';
// import 'package:medoc_patient_app/common/utils/colors.dart';
// import 'package:medoc_patient_app/common/utils/text_style.dart';
// // import 'package:medicare/styles/colors.dart';
// // import 'package:medicare/styles/styles.dart';

// class ScheduleTab extends StatefulWidget {
//   const ScheduleTab({Key? key}) : super(key: key);

//   @override
//   State<ScheduleTab> createState() => _ScheduleTabState();
// }

// enum FilterStatus { Upcoming, Complete, Cancel }

// List<Map> schedules = [
//   {
//     'img': 'assets/doctor01.jpeg',
//     'doctorName': 'Dr. Anastasya Syahid',
//     'doctorTitle': 'Dental Specialist',
//     'reservedDate': 'Monday, Aug 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'assets/doctor02.png',
//     'doctorName': 'Dr. Mauldya Imran',
//     'doctorTitle': 'Skin Specialist',
//     'reservedDate': 'Monday, Sep 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'assets/doctor03.jpeg',
//     'doctorName': 'Dr. Rihanna Garland',
//     'doctorTitle': 'General Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'assets/doctor04.jpeg',
//     'doctorName': 'Dr. John Doe',
//     'doctorTitle': 'Something Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Complete
//   },
//   {
//     'img': 'assets/doctor05.jpeg',
//     'doctorName': 'Dr. Sam Smithh',
//     'doctorTitle': 'Other Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Cancel
//   },
//   {
//     'img': 'assets/doctor05.jpeg',
//     'doctorName': 'Dr. Sam Smithh',
//     'doctorTitle': 'Other Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Cancel
//   },
// ];

// class _ScheduleTabState extends State<ScheduleTab> {
//   FilterStatus status = FilterStatus.Upcoming;
//   Alignment _alignment = Alignment.centerLeft;

//   @override
//   Widget build(BuildContext context) {
//     List<Map> filteredSchedules = schedules.where((var schedule) {
//       return schedule['status'] == status;
//     }).toList();

//     return Scaffold(
//       backgroundColor: Color(0xFFF8F8F8),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Schedule',
//               textAlign: TextAlign.center,
//               style: kTitleStyle,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: lightPrimaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       for (FilterStatus filterStatus in FilterStatus.values)
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 if (filterStatus == FilterStatus.Upcoming) {
//                                   status = FilterStatus.Upcoming;
//                                   _alignment = Alignment.centerLeft;
//                                 } else if (filterStatus ==
//                                     FilterStatus.Complete) {
//                                   status = FilterStatus.Complete;
//                                   _alignment = Alignment.center;
//                                 } else if (filterStatus ==
//                                     FilterStatus.Cancel) {
//                                   status = FilterStatus.Cancel;
//                                   _alignment = Alignment.centerRight;
//                                 }
//                               });
//                             },
//                             child: Center(
//                               child: Text(
//                                 filterStatus.name,
//                                 style:
//                                     kFilterStyle.copyWith(color: Colors.grey),
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 AnimatedAlign(
//                   duration: Duration(milliseconds: 200),
//                   alignment: _alignment,
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: primaryColor,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Center(
//                       child: Text(
//                         status.name,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredSchedules.length,
//                 itemBuilder: (context, index) {
//                   var _schedule = filteredSchedules[index];
//                   bool isLastElement = filteredSchedules.length + 1 == index;
//                   return Card(
//                     elevation: .8,
//                     margin: !isLastElement
//                         ? EdgeInsets.only(bottom: 20)
//                         : EdgeInsets.zero,
//                     child: Padding(
//                       padding: EdgeInsets.all(15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: AssetImage(_schedule['img']),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     _schedule['doctorName'],
//                                     style: TextStyle(
//                                       color: Color(MyColors.header01),
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     _schedule['doctorTitle'],
//                                     style: TextStyle(
//                                       color: Color(MyColors.grey02),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           DateTimeCard(),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: OutlinedButton(
//                                   child: Text('Cancel'),
//                                   onPressed: () {},
//                                   style: OutlinedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   child: Text('Reschedule'),
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: primaryColor,
//                                     onPrimary: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                   ),
//                                   onPressed: () => {},
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DateTimeCard extends StatelessWidget {
//   const DateTimeCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: lightPrimaryColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       width: double.infinity,
//       padding: EdgeInsets.all(10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 Icons.calendar_today,
//                 color: primaryColor,
//                 size: 15,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 'Mon, July 29',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: primaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Icon(
//                 Icons.access_alarm,
//                 color: primaryColor,
//                 size: 17,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 '11:00 ~ 12:10',
//                 style: TextStyle(
//                   color: primaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
