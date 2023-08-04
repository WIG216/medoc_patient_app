import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/pharma/controllers/location_controller.dart';
import 'package:medoc_patient_app/features/pharma/widgets/custom_info_window.dart';
import 'package:medoc_patient_app/features/pharma/widgets/search_sheet.dart';

import '../controllers/pharmacy_controller.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final PharmacyController _mapController = Get.find();
  LocationData? currentLocation;
  final Completer<GoogleMapController> _controller = Completer();

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

  void _animateToUser() async {
    if (_mapController.initialPosition != null) {
      _mapController.mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _mapController.initialPosition,
            zoom: 15,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            const Text(
              "Your location",
              style: TextStyle(fontSize: 12.0),
            ),
            MixinBuilder<LocationController>(
              init: LocationController(),
              builder: (controller) => Column(
                children: [
                  Text(
                    " ${controller.currentAddress.value}",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (_mapController.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (_mapController.currentLocation == null) {
            return Center(
              child: Text('Error: Unable to get current location.'),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: GoogleMap(
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    compassEnabled: false,
                    onMapCreated: (controller) {
                      _mapController.mapController = controller;
                      _animateToUser();
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        _mapController.currentLocation.latitude,
                        _mapController.currentLocation.longitude,
                      ),
                      zoom: 15,
                    ),
                    markers: {
                      // Marker(
                      //   markerId: const MarkerId("currentLocation"),
                      //   position: LatLng(currentLocation!.latitude!,
                      //       currentLocation!.longitude!),
                      //   icon: BitmapDescriptor.defaultMarkerWithHue(
                      //       BitmapDescriptor.hueAzure),
                      // ),
                      //           Marker(
                      //             markerId: MarkerId('origin'),
                      //             position: LatLng(
                      //               _mapController.currentLocation.latitude,
                      //               _mapController.currentLocation.longitude,
                      //             ),
                      //             infoWindow: InfoWindow(title: 'Your location'),
                      //             icon:    BitmapDescriptor.fromAssetImage(
                      // const ImageConfiguration(), "assets/person_indicator.jpg"),
                      //           ),

                      ..._mapController.pharmacies.map((pharmacy) {
                        return Marker(
                          markerId: MarkerId(pharmacy.name),
                          position:
                              LatLng(pharmacy.latitude, pharmacy.longitude),
                          infoWindow: InfoWindow(
                            title: pharmacy.name,
                          ),
                          onTap: () {
                            _mapController.getDirections(
                              LatLng(_mapController.currentLocation.latitude,
                                  _mapController.currentLocation.longitude),
                              LatLng(pharmacy.latitude, pharmacy.longitude),
                            );
                          },
                        );
                      }),
                    },
                    // markers:
                    //     Set<Marker>.from(_mapController.pharmacies.map((pharmacy) {
                    //   return Marker(
                    //     markerId: MarkerId(pharmacy.name),
                    //     position: LatLng(pharmacy.latitude, pharmacy.longitude),
                    //     infoWindow: InfoWindow(title: pharmacy.name),
                    //     onTap: () {
                    //       _mapController.getDirections(
                    //         LatLng(_mapController.currentLocation.latitude,
                    //             _mapController.currentLocation.longitude),
                    //         LatLng(pharmacy.latitude, pharmacy.longitude),
                    //       );
                    //     },
                    //   );
                    // })),

                    polylines:
                        Set<Polyline>.of(_mapController.polylines.values),
                    // polylines: Set<Polyline>.from(_mapController.polylines),
                  ),
                ),

                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.31,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.255,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 189, 188, 188),
                                      blurRadius: 20,
                                      offset: Offset(2, 2), // Shadow position
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 12.0,
                                  ),
                                  child: Column(
                                    children: [
                                      6.height,
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                        ),
                                        child: ListTile(
                                          leading: Image.asset(
                                            "assets/images/pharmacy01.png",
                                            width: 40,
                                            height: 40,
                                          ),
                                          title: Text(
                                            "Which Pharmacy?",
                                            style: smallHeaderStyle,
                                          ),
                                          trailing: Icon(Icons.arrow_forward),
                                          onTap: openBottomSheet,
                                        ),
                                      ),
                                      6.height,
                                      Row(
                                        children: [
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.3,
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
                                                  _mapController.distanceText,
                                                  style: smallHeaderStyle,
                                                ),
                                                Text(
                                                  _mapController.durationText,
                                                  style: subtitleStyle,
                                                ),
                                                28.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/pharmacy02.png",
                                                      width: 30,
                                                      height: 30,
                                                    ),
                                                    Image.asset(
                                                      "assets/images/person_indicator.png",
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          8.width,
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: Container(
                                          //     padding: const EdgeInsets.all(12),
                                          //     decoration: BoxDecoration(
                                          //       color: Colors.grey.withOpacity(0.2),
                                          //       borderRadius:
                                          //           BorderRadius.circular(12),
                                          //     ),
                                          //     child: Column(
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.start,
                                          //       children: [
                                          //         Text(
                                          //           "Doual 5e",
                                          //           style: TextStyle(
                                          //             fontWeight: FontWeight.bold,
                                          //           ),
                                          //         ),
                                          //         Text(
                                          //           "22 min",
                                          //           style: TextStyle(
                                          //             fontWeight: FontWeight.w300,
                                          //             fontSize: 12,
                                          //           ),
                                          //         ),
                                          //         28.height,
                                          //         Row(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .spaceBetween,
                                          //           crossAxisAlignment:
                                          //               CrossAxisAlignment.end,
                                          //           children: [
                                          //             Image.asset(
                                          //               "assets/images/pharmacy02.png",
                                          //               width: 30,
                                          //               height: 30,
                                          //             ),
                                          //             Image.asset(
                                          //               "assets/images/person_indicator.png",
                                          //               width: 40,
                                          //               height: 40,
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),
                                       
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Column(
                //     children: [
                //       Text('Distance: ${_mapController.distanceText}'),
                //       Text('Duration: ${_mapController.durationText}'),
                //     ],
                //   ),
                // ),
              ],
            );
          }
        },
      ),
    
    );
  
  }

}
