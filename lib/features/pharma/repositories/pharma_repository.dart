// pharmacy_repository.dart
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as places;
import 'package:google_maps_webservice/directions.dart' as directions;

import 'package:medoc_patient_app/features/pharma/repositories/pharma_model.dart';

class PharmacyRepository {
  final places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(
      apiKey: 'AIzaSyCYK9ZKo_cxpG_tfJwdVOPyE5E7gAKSjZA');

  final directions.GoogleMapsDirections _directions =
      directions.GoogleMapsDirections(
          apiKey: 'AIzaSyDq0VhxE2OAwKGomc1uzF6PW7sgkU_R71o');

  Future<List<PharmacyModel>> getNearbyPharmacies(
      double lat, double lng) async {
    List<PharmacyModel> pharmacies = [];
    places.Location location = places.Location(lat: lat, lng: lng);
    places.PlacesSearchResponse response = await _places.searchNearbyWithRadius(
      location,
      2000, // Radius in meters (adjust as needed)
      type:
          'pharmacy', // You can specify other types as well, like 'hospital', 'doctor', etc.
    );
    print(response.results);

    if (response.isOkay) {
      for (places.PlacesSearchResult result in response.results) {
        Map<String, dynamic> resultJson = result.toJson();
        PharmacyModel pharmacy = PharmacyModel.fromJson(resultJson);
        pharmacies.add(pharmacy);
      }
    }

    print(pharmacies);
    return pharmacies;
  }

  Future<List<LatLng>> getPolyline(LatLng source, LatLng destination) async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    // PolylinePoints polylinePoints = PolylinePoints(); // Correct instantiation
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyDq0VhxE2OAwKGomc1uzF6PW7sgkU_R71o',
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      polylineCoordinates = result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    }
    return polylineCoordinates;
  }

  Future<String> getDistanceAndDuration(
      LatLng source, LatLng destination) async {
    final directions.DirectionsResponse response =
        await _directions.directionsWithLocation(
      directions.Location(lat: source.latitude, lng: source.longitude),
      directions.Location(
          lat: destination.latitude, lng: destination.longitude),
    );

    if (response.isOkay) {
      final directions.Route route = response.routes.first;
      final directions.Leg leg = route.legs.first;
      final String distance = leg.distance!.text;
      final String duration = leg.duration!.text;
      return '$distance | $duration';
    } else {
      return '';
    }
  }
}
