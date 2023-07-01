// import 'package:flutter/material.dart';
// import 'package:medoc_patient_app/common/utils/colors.dart';
// import 'package:medoc_patient_app/common/utils/text_style.dart';

// class AppointmentTabs extends StatefulWidget {
//   const AppointmentTabs({super.key});

//   @override
//   State<AppointmentTabs> createState() => _AppointmentTabsState();
// }

//   enum FilterStatus { Morning, Evening }

//   List<Map> period = [
//     {
//       "time": "9:00AM",
//       "status": FilterStatus.Morning
//     },
//     {
//       "time": "9:00AM",
//       "status": FilterStatus.Morning
//     },
//     {
//       "time": "9:00AM",
//       "status": FilterStatus.Morning
//     },
//     {
//       "time": "9:00AM",
//       "status": FilterStatus.Morning
//     },
//     {
//       "time": "9:00AM",
//       "status": FilterStatus.Morning
//     },
//     {
//       "time": "4:30PM",
//       "status": FilterStatus.Evening
//     },
//     {
//       "time": "5:00PM",
//       "status": FilterStatus.Evening
//     },
//     {
//       "time": "5:30PM",
//       "status": FilterStatus.Evening
//     },
//     {
//       "time": "6:00PM",
//       "status": FilterStatus.Evening
//     },
//   ];

// class _AppointmentTabsState extends State<AppointmentTabs> {

//   FilterStatus status = FilterStatus.Morning;
//   Alignment _alignment = Alignment.centerLeft;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
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
//                                 if (filterStatus == FilterStatus.Morning) {
//                                   status = FilterStatus.Morning;
//                                   _alignment = Alignment.centerLeft;
                                
//                                 } else if (filterStatus ==
//                                     FilterStatus.Evening) {
//                                   status = FilterStatus.Evening;
//                                   _alignment = Alignment.centerRight;
//                                 }
//                               });
//                             },
//                             child: Center(
//                               child: Text(
//                                 filterStatus.name,
//                                 style: subtitleStyle.copyWith(fontSize: 14, fontWeight: FontWeight.bold,),
//                               //   style:
//                               //       kFilterStyle.copyWith(color: Colors.grey),
//                               // ),
//                             ),
//                           ),
//                         ),
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
//                         style: smallHeaderStyle.copyWith(color: whiteColor, fontSize: 14)
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
            
//         ],
//       ),
//     );
//   }
// }