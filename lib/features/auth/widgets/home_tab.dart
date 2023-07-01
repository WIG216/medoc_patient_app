// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medoc_patient_app/common/utils/colors.dart';
// import 'package:medoc_patient_app/common/utils/text_style.dart';
// import 'package:medoc_patient_app/features/main/widgets/appointment_card.dart';
// import 'package:medoc_patient_app/features/main/widgets/category_icon.dart';
// import 'package:medoc_patient_app/routes.dart';


// class HomeTab extends StatelessWidget {
//   final void Function() onPressedScheduleCard;

//   const HomeTab({
//     Key? key,
//     required this.onPressedScheduleCard,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             UserIntro(),
//             SizedBox(
//               height: 10,
//             ),
//             SearchInput(),
//             SizedBox(
//               height: 20,
//             ),
//             CategoryIcons(),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Appointment Today',
//                   style: kTitleStyle,
//                 ),
//                 TextButton(
//                   child: Text(
//                     'See All',
//                     style: TextStyle(
//                       color: Color(MyColors.yellow01),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             AppointmentCard(
//               onTap: onPressedScheduleCard,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Top Doctor',
//               style: TextStyle(
//                 color: Color(MyColors.header01),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             // for (var doctor in doctors)
//             //   TopDoctorCard(
//             //     img: doctor['img'],
//             //     doctorName: doctor['doctorName'],
//             //     doctorTitle: doctor['doctorTitle'],
//             //   )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TopDoctorCard extends StatelessWidget {
//   String img;
//   String doctorName;
//   String doctorTitle;

//   TopDoctorCard({
//     required this.img,
//     required this.doctorName,
//     required this.doctorTitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 20),
//       child: InkWell(
//         onTap: () {
//           Get.toNamed(AppRoutes.doctor_detail);
//         },
//         child: Row(
//           children: [
//             Container(
//               color: Color(MyColors.grey01),
//               child: Image(
//                 width: 100,
//                 image: AssetImage(img),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   doctorName,
//                   style: TextStyle(
//                     color: Color(MyColors.header01),
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   doctorTitle,
//                   style: TextStyle(
//                     color: Color(MyColors.grey02),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: Color(MyColors.yellow02),
//                       size: 18,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       '4.0 - 50 Reviews',
//                       style: TextStyle(color: Color(MyColors.grey02)),
//                     )
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }




// class SearchInput extends StatelessWidget {
//   const SearchInput({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Color(MyColors.bg),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 3),
//             child: Icon(
//               Icons.search,
//               color: Color(MyColors.purple02),
//             ),
//           ),
//           const SizedBox(
//             width: 15,
//           ),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: 'Search a doctor or health issue',
//                 hintStyle: TextStyle(
//                     fontSize: 13,
//                     color: Color(MyColors.purple01),
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UserIntro extends StatelessWidget {
//   const UserIntro({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text(
//               'Hello',
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             Text(
//               'Brad King 👋',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),
//           ],
//         ),
//         const CircleAvatar(
//           backgroundImage: AssetImage('assets/person.jpeg'),
//         )
//       ],
//     );
//   }
// }