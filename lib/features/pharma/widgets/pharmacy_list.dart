// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:medoc_patient_app/features/pharmacy/controllers/map_controller.dart';
// // import 'package:medoc_patient_app/features/pharmacy/controllers/search_controller.dart';
// class PharmacyList extends GetView<SearchingController> {
//   PharmacyList({super.key});
//   SearchingController searchingController = Get.put(SearchingController());
//   MapController mapsController = Get.put(MapController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => searchingController.isDataLoading.value
//         ? const Center(child: CircularProgressIndicator())
//         : Column(
//             children: ListTile.divideTiles(
//                 context: context,
//                 color: Colors.grey.withOpacity(0.2),
//                 tiles: searchingController.phamacies.map(
//                   (element) => ListTile(
//                     leading: Icon(Icons.local_hospital),
//                     title: Text(
//                       element['name'],
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text("Litoral, Wouri, Douala"),
//                     onTap: () {
//                       mapsController.getDirections(
//                           double.parse(element['location']['latitude']),
//                           double.parse(element['location']['longitude']));
//                       Get.back();
//                     },
//                   ),
//                 )).toList(),
//           ));
//   }
// }
