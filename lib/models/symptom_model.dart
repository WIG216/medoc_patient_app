class Symptom {
  final String disease;
  final String description;
  final String precaution;

  Symptom({required this.disease, required this.description, required this.precaution});

  factory Symptom.fromJson(Map<String, dynamic> json) {
    return Symptom(
      disease: json['disease'],
      description: json['description'],
      precaution: json['precaution'],
    );
  }
}
