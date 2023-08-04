class HeartDiseaseResponse {
  String heartDiseaseDiagnosis;
  int heartDiseasePrediction;

  HeartDiseaseResponse({required this.heartDiseaseDiagnosis, required this.heartDiseasePrediction});

  factory HeartDiseaseResponse.fromJson(Map<String, dynamic> json) {
    return HeartDiseaseResponse(
      heartDiseaseDiagnosis: json['HeartDiseaseDiagnosis'],
      heartDiseasePrediction: json['HeartDiseasePrediction'],
    );
  }
}
