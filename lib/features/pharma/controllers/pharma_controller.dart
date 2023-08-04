// order_tracking_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:medoc_patient_app/features/pharma/repositories/pharma_model.dart';

import '../repositories/pharma_repository.dart';

class OrderTrackingController extends GetxController {
  final PharmacyRepository _pharmacyRepository = PharmacyRepository();

  final Rx<LocationData?> _currentLocation = Rx<LocationData?>(null);
  LocationData? get currentLocation => _currentLocation.value;

  final RxList<PharmacyModel> _nearbyPharmacies = RxList<PharmacyModel>([]);
  List<PharmacyModel> get nearbyPharmacies => _nearbyPharmacies;

  final RxList<Polyline> _polylines = RxList<Polyline>([]);
  List<Polyline> get polylines => _polylines;

  final RxString _distanceAndDuration = RxString('');
  String get distanceAndDuration => _distanceAndDuration.value;

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Location location = Location();

    location.onLocationChanged.listen((locationData) {
      _currentLocation.value = locationData;
      _getNearbyPharmacies(locationData.latitude!, locationData.longitude!);
    });
  }

  void _getNearbyPharmacies(double lat, double lng) async {
    List<PharmacyModel> pharmacies = await _pharmacyRepository.getNearbyPharmacies(lat, lng);
    _nearbyPharmacies.assignAll(pharmacies);

    if (pharmacies.isNotEmpty) {
      LatLng source = LatLng(_currentLocation.value!.latitude!, _currentLocation.value!.longitude!);
      LatLng destination = LatLng(pharmacies.first.latitude, pharmacies.first.longitude);
      _updatePolylines(source, destination);
      _updateDistanceAndDuration(source, destination);
    } else {
      _polylines.clear();
      _distanceAndDuration.value = '';
    }
  }

  void onPharmacySelected(LatLng destination) {
    LatLng source = LatLng(_currentLocation.value!.latitude!, _currentLocation.value!.longitude!);
    _updatePolylines(source, destination);
    _updateDistanceAndDuration(source, destination);
  }

  void _updatePolylines(LatLng source, LatLng destination) async {
    List<LatLng> polylineCoordinates = await _pharmacyRepository.getPolyline(source, destination);
    List<Polyline> polylines = PolylineUtils.createPolylines(polylineCoordinates);
    _polylines.assignAll(polylines);
  }

  void _updateDistanceAndDuration(LatLng source, LatLng destination) async {
    String distanceAndDuration = await _pharmacyRepository.getDistanceAndDuration(source, destination);
    _distanceAndDuration.value = distanceAndDuration;
  }
}


// import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineUtils {
  static List<Polyline> createPolylines(List<LatLng> polylineCoordinates) {
    List<Polyline> polylines = [];

    if (polylineCoordinates.isNotEmpty) {
      polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          points: polylineCoordinates,
          color: Color(0xFF7B61FF),
          width: 6,
        ),
      );
    }

    return polylines;
  }
}