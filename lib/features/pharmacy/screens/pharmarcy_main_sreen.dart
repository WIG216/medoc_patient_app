import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/location_controller.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/map_controller.dart';
import 'package:medoc_patient_app/features/pharmacy/screens/menu_sheet.dart';

import 'searchSheet.dart';

class PharmarcyMainPage extends StatelessWidget{
  PharmarcyMainPage({super.key});
  final MapController mapController = Get.find<MapController>();
  final LocationController locationController = Get.find<LocationController>();

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 720,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: SearchSheet(),
      ),
      // backgroundColor: Colors.white,
      isScrollControlled: true,
      ignoreSafeArea: false,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void openMenuBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 720,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: const MenuSheet(),
      ),
      isScrollControlled: true,
      ignoreSafeArea: false,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LocationController(),
      builder: (locationController) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
                onPressed: openMenuBottomSheet, icon: Icon(Icons.menu)),
            backgroundColor: Colors.transparent,
            title: Column(
              children: [
                const Text(
                  "Your location",
                  style: TextStyle(fontSize: 10.0),
                ),
                MixinBuilder<LocationController>(
                  init: LocationController(),
                  builder: (controller) => Column(
                    children: [
                      Text(
                        " ${controller.currentAddress.value}",
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: Stack(
            // alignment: AlignmentDirectional.bottomStart,
            children: [
              // Navigator(
              //   key: Get.nestedKey(1),
              //   initialRoute: '/browse',
              //   onGenerateRoute: controller.onGenerateRoute,
              // ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => {},
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(2, 2), // Shadow position
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.navigation_outlined,
                              color: Colors.black,
                              weight: 0.2,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Align(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.8),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                height: 5.0,
                                width: 40.0,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(2, 2), // Shadow position
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            height: 358.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 5.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 6.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0),),
                                    ),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.medical_information,
                                        color: Color(0xFF007BFF),
                                        size: 30,
                                      ),
                                      title: const Text(
                                        "Search Drug",
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                      trailing: Icon(Icons.arrow_forward),
                                      onTap: openBottomSheet,
                                    ),
                                  ),
                                  SizedBox(height: 6.0),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Doual 5e",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "22 min",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              leading: CircleAvatar(radius: 15, backgroundColor: Colors.grey.withOpacity(0.2),),
                                              trailing: Icon(
                                                Icons.local_activity,
                                                size: 30,
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Doual 5e",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "22 min",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              ListTile(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  horizontal: 1,
                                                ),
                                                leading: CircleAvatar(
                                                  radius: 20,
                                                ),
                                                trailing: Icon(
                                                  Icons.local_activity,
                                                  size: 30,
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.0),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Doual 5e",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "22 min",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            ListTile(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              leading: CircleAvatar(radius: 15),
                                              trailing: Icon(
                                                Icons.local_activity,
                                                size: 30,
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Doual 5e",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "22 min",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              ListTile(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  horizontal: 1,
                                                ),
                                                leading: CircleAvatar(
                                                  radius: 20,
                                                ),
                                                trailing: Icon(
                                                  Icons.local_activity,
                                                  size: 30,
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Doual 5e",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "22 min",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              ListTile(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                  horizontal: 1,
                                                ),
                                                leading: CircleAvatar(
                                                  radius: 20,
                                                ),
                                                trailing: Icon(
                                                  Icons.local_activity,
                                                  size: 30,
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: const Icon(Icons.refresh),
          //   mini: true,
          // ),
        );
      },
    );
  }
}
