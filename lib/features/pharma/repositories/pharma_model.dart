class PharmacyModel {
  final String id;
  final String name;
  final String vicinity;
  final double latitude;
  final double longitude;

  PharmacyModel({
    required this.id,
    required this.name,
    required this.vicinity,
    required this.latitude,
    required this.longitude,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) {
    return PharmacyModel(
      id: json['place_id'],
      name: json['name'],
      vicinity: json['vicinity'],
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place_id': id,
      'name': name,
      'vicinity': vicinity,
      'geometry': {
        'location': {
          'lat': latitude,
          'lng': longitude,
        },
      },
    };
  }
}
