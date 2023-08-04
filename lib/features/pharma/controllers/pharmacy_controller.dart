import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/features/pharma/repositories/pharmacy_repository.dart';
import 'package:medoc_patient_app/models/pharmacy.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/places.dart' as Places;

class PharmacyController extends GetxController {
  final PharmacyRepository _repository = PharmacyRepository();
  final Rx<Position> _currentLocation = Rx<Position>(Position(
    latitude: 0.0,
    longitude: 0.0,
    accuracy: 0.0,
    altitude: 0.0,
    speedAccuracy: 0.0,
    speed: 0.0,
    heading: 0.0,
    timestamp: DateTime.now(),
  ));
  RxList<Pharmacy> _pharmacies = RxList<Pharmacy>();
  RxBool _isLoading = RxBool(false);
  Set<Polyline> _polylines = {};

  Position get currentLocation => _currentLocation.value;
  // Set<Polyline> get polylines => _polylines;
  RxString _distanceText = RxString('');
  RxString _durationText = RxString('');

  List<Pharmacy> get pharmacies => _pharmacies;
  bool get isLoading => _isLoading.value;
  String get distanceText => _distanceText.value;
  String get durationText => _durationText.value;

  PolylinePoints polylinePoints = PolylinePoints();
  var polyline = <Polyline>{}.obs;
  var polylines = <PolylineId, Polyline>{}.obs; //polylines to show direction

  @override
  void onInit() {
    super.onInit();
    fetchPharmacyLocations();
    _getUserLocation();

    print("CURRENT LOCATION: $currentLocation");
  }

  late GoogleMapController mapController;
  Rx<LatLng> _initialPosition = Rx<LatLng>(LatLng(0, 0));
  LatLng get initialPosition => _initialPosition.value;

  void _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _initialPosition.value = LatLng(position.latitude, position.longitude);
    } catch (e) {}
  }

  Future<void> fetchPharmacyLocations() async {
    try {
      _isLoading.value = true;
      _currentLocation.value = await _repository.getCurrentLocation();
      print("CURRENT LOCATION: $_currentLocation");

      _pharmacies.value =
          await _repository.getPharmacyLocations(_currentLocation.value);
    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  makePolyline(double lat, double long) {
    polyline.add(Polyline(
        polylineId: PolylineId('1'),
        points: [
          LatLng(currentLocation.latitude, currentLocation.longitude),
          LatLng(lat, long)
        ],
        color: primaryColor,
        width: 3));
    _isLoading.value = true;
    print(polyline.obs.value);
  }

  getDirections(LatLng origin, LatLng destination) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDq0VhxE2OAwKGomc1uzF6PW7sgkU_R71o",
      PointLatLng(destination.latitude, destination.longitude),
      PointLatLng(origin.latitude, origin.longitude),
      travelMode: TravelMode.walking,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);

    try {
      _isLoading.value = true;
      _polylines.clear();

      String apiKey = 'AIzaSyDq0VhxE2OAwKGomc1uzF6PW7sgkU_R71o';
      String baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';
      String url =
          '$baseUrl?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving&key=$apiKey';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print("DATA: ${data}");
        if (data['status'] == 'OK') {
          List<LatLng> points = [];
          for (var step in data['routes'][0]['legs'][0]['steps']) {
            points.add(LatLng(
              step['end_location']['lat'],
              step['end_location']['lng'],
            ));
          }
          // Extract distance and duration from the response and update the values
          String distanceText =
              data['routes'][0]['legs'][0]['distance']['text'];
          String durationText =
              data['routes'][0]['legs'][0]['duration']['text'];
          _distanceText.value = distanceText;
          _durationText.value = durationText;
        } else {
          throw Exception('Error: Unable to fetch directions.');
        }
      } else {
        throw Exception('Error: Unable to fetch directions.');
      }
    } catch (e) {
      print('Error drawing polyline: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: primaryColor,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  final RxList<Places.PlacesSearchResult> pharm =
      RxList<Places.PlacesSearchResult>([]);
  final Rx<Places.PlacesDetailsResponse?> selectedPlace =
      Rx<Places.PlacesDetailsResponse?>(null);

  Future<void> _searchPharmacies() async {
    List<Places.PlacesSearchResult> results =
        await _repository.searchPharmacies(initialPosition);
    pharm.value = results;
  }

  Future<void> getPlaceDetails(String placeName) async {
    print("PLACE NAME: $placeName");
    try {
      var response = await _repository.getPlaceDetails(placeName);

      print('RESPONSE: $response');
      selectedPlace.value = response;
    } catch (e) {
      var response = await _repository.getPlaceDetails(placeName);

      print('RESPONSE: $response');
      print('Error getting place details: $e');
      Get.snackbar('Place', response.toString());
    }
  }
}
