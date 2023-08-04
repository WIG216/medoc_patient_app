import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:medoc_patient_app/models/pharmacy.dart';
import 'package:google_maps_webservice/places.dart' as Places;


class PharmacyRepository {
  Future<Position> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Pharmacy>> getPharmacyLocations(Position currentPosition) async {
    String apiKey = 'AIzaSyDq0VhxE2OAwKGomc1uzF6PW7sgkU_R71o';
    String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
    String url =
        '$baseUrl?location=${currentPosition.latitude},${currentPosition.longitude}&radius=5000&type=pharmacy&key=$apiKey';

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'OK') {
          List<Pharmacy> pharmacies = [];
          for (var result in data['results']) {
            String name = result['name'];
            double lat = result['geometry']['location']['lat'];
            double lng = result['geometry']['location']['lng'];
            pharmacies.add(Pharmacy(name: name, latitude: lat, longitude: lng));
          }
          return pharmacies;
        } else {
          throw Exception('Error: Unable to fetch pharmacy locations.');
        }
      } else {
        throw Exception('Error: Unable to fetch pharmacy locations.');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

   Future<List<LatLng>> getRouteCoordinates(LatLng origin, LatLng destination, String travelMode) async {
    String apiKey = 'AIzaSyDq0VhxE2OAwKGomc1uzF6PW7sgkU_R71o';
    String baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';
    String url =
        '$baseUrl?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=$travelMode&key=$apiKey';

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['status'] == 'OK') {
          List<LatLng> points = [];
          for (var step in data['routes'][0]['legs'][0]['steps']) {
            points.add(LatLng(
              step['end_location']['lat'],
              step['end_location']['lng'],
            ));
          }
          return points;
        } else {
          throw Exception('Error: Unable to fetch directions.');
        }
      } else {
        throw Exception('Error: Unable to fetch directions.');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Pharmacy? findNearestPharmacy(Position currentLocation, List<Pharmacy> pharmacies) {
  double minDistance = double.infinity;
  Pharmacy? nearestPharmacy;

  for (Pharmacy pharmacy in pharmacies) {
    double distance = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      pharmacy.latitude,
      pharmacy.longitude,
    );

    if (distance < minDistance) {
      minDistance = distance;
      nearestPharmacy = pharmacy;
    }
  }

  return nearestPharmacy;
}

  final places = Places.GoogleMapsPlaces(apiKey: 'AIzaSyCYK9ZKo_cxpG_tfJwdVOPyE5E7gAKSjZA');

   Future<List<Places.PlacesSearchResult>> searchPharmacies(LatLng userLocation) async {
    final response = await places.searchNearbyWithRadius(
      Places.Location(lat: userLocation.latitude, lng: userLocation.longitude),
      5000, // Search radius in meters (adjust as needed)
      type: "pharmacy",
    );
    return response.results;
  }

  Future<Places.PlacesDetailsResponse> getPlaceDetails(String placeName) async {
    final response = await places.searchByText(placeName);
    if (response.results.isNotEmpty) {
      String placeId = response.results.first.placeId;
      return await places.getDetailsByPlaceId(placeId);
    } else {
      throw Exception("Place not found");
    }
  }
}
