import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;

class DoctorLocation extends StatelessWidget {
  const DoctorLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(4.080807, 9.771714),
            zoom: 13.0,
          ),
          // layers: [
          //   TileLayerOptions(
          //     urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          //     subdomains: ['a', 'b', 'c'],
          //   ),
          // ],
        ),
      ),
    );
  }
}
