import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  var currentAddress = ''.obs;
  var currentPosition = LatLng(0, 0).obs;
  var cameraPosition = CameraPosition(
    target: LatLng(0, 0),
    zoom: 16,
  ).obs;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled. Please enable the services");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permissions are denied");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
          "Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition.value = LatLng(position.latitude, position.longitude);
      print(currentPosition.value);
      cameraPosition.value = CameraPosition(
        target: currentPosition.value,
        zoom: 16,
      );

      print("CURRENT POSITIONs: $currentPosition");

      _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position!.latitude, position!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress.value = '${place.subLocality}';
      print(place);
      print(currentAddress.value);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    _getCurrentPosition();
    super.onInit();
  }
}
