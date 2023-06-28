import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/location_controller.dart';

class MapController extends GetxController {
  var isDataLoading = false.obs;
  var isLoadingPolyline = false.obs;
  PolylinePoints polylinePoints = PolylinePoints();
  var polylines = <PolylineId, Polyline>{}.obs; //polylines to show direction
 final locationController = Get.find<LocationController>();
  var polyline = <Polyline>{}.obs;

  var pharmacies = [].obs;
  getPharmacies() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse('http://localhost:8070/allPharmacies')!,
      );
      if (response.statusCode == 200) {
        ///data successfully

        var result = jsonDecode(response.body);
        pharmacies.value = result;
        print(result);
      } else {
        ///error
        print("error");
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }

  makePolyline(double lat, double long) {
    polyline.add(Polyline(
        polylineId: PolylineId('1'),
        // points: [LatLng(4.080807, 9.771714), LatLng(lat, long)],
        points: [locationController.currentPosition.value, LatLng(lat, long)],
        color: Colors.deepPurple,
        width: 3));
    isLoadingPolyline.value = true;
    print(polyline.obs.value);
  }

  getDirections(double lat, double long) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDq0VhxE2OAwKGomc1uzF6PW7sgkU_R71o",
      PointLatLng(lat, long),
      PointLatLng(4.080807, 9.771714),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("object");
    getPharmacies();
    super.onInit();
  }
}
