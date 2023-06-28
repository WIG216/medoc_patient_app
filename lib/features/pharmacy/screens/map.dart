import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/location_controller.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/map_controller.dart';
class MapPage extends StatelessWidget {
  MapPage({super.key});
  late GoogleMapController mapController;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  final Set<Polyline> _polyline = {};

  final mapsController = Get.find<MapController>();
  // MapController mapsController = Get.put(MapController());
  final locationController = Get.find<LocationController>();
  // LocationController locationController = Get.put(LocationController());

  final LatLng _center = const  LatLng(4.0844767, 9.73448);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
// Create the polylines for showing the route between two places

  @override
  Widget build(BuildContext context) {
    return Obx(() => mapsController.isDataLoading.value
        ? const Center(child: CircularProgressIndicator())
        : GoogleMap(
            onMapCreated: _onMapCreated,
            polylines: Set<Polyline>.of(mapsController.polylines.values),
            markers: mapsController.pharmacies
                .map(
                  (element) => Marker(
                    markerId: MarkerId(element['id']),
                    infoWindow: InfoWindow(title: element['name']),
                    position: LatLng(
                        double.parse(element['location']['latitude']),
                        double.parse(element['location']['longitude'])),
                    draggable: true,
                    onTap: () {
                      print(element);
                      mapsController.getDirections(
                          double.parse(element['location']['latitude']),
                          double.parse(element['location']['longitude']));
                    },
                    // To do: custom marker icon
                  ),
                )
                .toSet(),
            myLocationEnabled: true,
            // initialCameraPosition: CameraPosition(
            //   target: _center,
            //   zoom: 20
            // ),
            initialCameraPosition: locationController.cameraPosition.value!,
              
          ));
  }
}