class DiseaseInfo {
  final String description;
  final String disease;
  final String precautions;

  DiseaseInfo({
    required this.description,
    required this.disease,
    required this.precautions,
  });

  factory DiseaseInfo.fromJson(Map<String, dynamic> json) {
    return DiseaseInfo(
      description: json['description'],
      disease: json['disease'],
      precautions: json['precautions'],
    );
  }
}
