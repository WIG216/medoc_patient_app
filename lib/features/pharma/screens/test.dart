import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medoc_patient_app/features/pharma/controllers/pharmacy_controller.dart';
import 'package:google_maps_webservice/places.dart' as Places;
import 'package:medoc_patient_app/models/pharmacy.dart';

class PharmacyMapScreen extends StatelessWidget {
  final PharmacyController googlePlacesController = Get.find();
  final TextEditingController _placeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Map'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _placeNameController,
              decoration: InputDecoration(
                labelText: 'Enter Place Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_placeNameController.text.isNotEmpty) {
                print(_placeNameController.text);
                googlePlacesController
                    .getPlaceDetails(_placeNameController.text);
              }
            },
            child: Text('Get Place Details'),
          ),
          Expanded(
            child: Obx(
              () => googlePlacesController.initialPosition == null
                  ? Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: googlePlacesController.initialPosition,
                        zoom: 15,
                      ),
                      onMapCreated: (controller) {},
                      markers: _buildMarkers(),
                      polylines: _buildPolyline(),
                    ),
            ),
          ),
          Expanded(
            child: Obx(
              () => googlePlacesController.selectedPlace.value != null
                  ? ListView.builder(
                      itemCount: googlePlacesController.pharmacies.length,
                      itemBuilder: (context, index) {
                        Pharmacy pharmacy =
                            googlePlacesController.pharmacies[index];
                        return ListTile(
                          title: Text(pharmacy.name ?? ''),
                          // subtitle: Text(pharmacy. ?? ''),
                          onTap: () {
                            // googlePlacesController.drawPolyline(
                            //   LatLng(pharmacy.geometry!.location.lat, pharmacy.geometry!.location.lng),
                            // );
                          },
                        );
                      },
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};

    if (googlePlacesController.initialPosition != null) {
      markers.add(
        Marker(
          markerId: MarkerId('current_position'),
          position: googlePlacesController.initialPosition,
        ),
      );
    }

    if (googlePlacesController.selectedPlace.value != null) {
      Places.Location location =
          googlePlacesController.selectedPlace.value!.result.geometry!.location;
      markers.add(
        Marker(
          markerId: MarkerId('selected_place'),
          position: LatLng(location.lat, location.lng),
        ),
      );
    }

    return markers;
  }

  Set<Polyline> _buildPolyline() {
    Set<Polyline> polylines = {};

    // if (googlePlacesController.initialPosition != null &&
    //     googlePlacesController.destination.value != null) {
    //   polylines.add(
    //     Polyline(
    //       polylineId: PolylineId('polyline_to_pharmacy'),
    //       color: Colors.blue,
    //       points: [
    //         googlePlacesController.initialPosition.value,
    //         googlePlacesController.destination.value,
    //       ],
    //     ),
    //   );
    // }

    return polylines;
  }
}
