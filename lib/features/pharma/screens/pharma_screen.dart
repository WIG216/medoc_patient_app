// order_tracking_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medoc_patient_app/features/pharma/controllers/pharma_controller.dart';
import 'package:medoc_patient_app/features/pharma/repositories/pharma_model.dart';

class OrderTrackingPage extends StatelessWidget {
 final OrderTrackingController _controller = Get.put(OrderTrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: Stack(
        children: [
          _buildGoogleMap(),
          _buildNearbyPharmaciesList(),
          _buildDistanceDurationInfo(),
        ],
      ),
    );
  }

  Widget _buildGoogleMap() {
    return GetBuilder<OrderTrackingController>(
      builder: (_) {
        if (_controller.currentLocation == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                _controller.currentLocation!.latitude!,
                _controller.currentLocation!.longitude!,
              ),
              zoom: 13.5,
            ),
            markers: _buildMarkers(),
            polylines: Set.from(_controller.polylines),
          );
        }
      },
    );
  }

  Set<Marker> _buildMarkers() {
    return _controller.nearbyPharmacies.map(
      (pharmacy) => Marker(
        markerId: MarkerId(pharmacy.name),
        position: LatLng(pharmacy.latitude, pharmacy.longitude),
        infoWindow: InfoWindow(
          title: pharmacy.name,
          snippet: pharmacy.vicinity,
        ),
      ),
    ).toSet();
  }
Widget _buildNearbyPharmaciesList() {
  return Positioned(
    bottom: 16,
    left: 16,
    right: 16,
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nearby Pharmacies',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _controller.nearbyPharmacies.length,
              itemBuilder: (context, index) {
                PharmacyModel pharmacy = _controller.nearbyPharmacies[index];
                return ListTile(
                  title: Text(pharmacy.name),
                  subtitle: Text(pharmacy.vicinity),
                  onTap: () {
                    LatLng destination = LatLng(pharmacy.latitude, pharmacy.longitude);
                    _controller.onPharmacySelected(destination);
                  },
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildDistanceDurationInfo() {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Obx(
          () => Text(
            _controller.distanceAndDuration,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
