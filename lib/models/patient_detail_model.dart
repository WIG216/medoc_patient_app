class PatientDetail {
   String patientName;
   String patientGender;
   int patientAge;
   String patientProblem;

  PatientDetail({
    required this.patientName,
    required this.patientGender,
    required this.patientAge,
    required this.patientProblem,
  });

  Map<String, dynamic> toMap() {
    return {
      'patientName': patientName,
      'patientGender': patientGender,
      'patientAge': patientAge,
      'patientProblem': patientProblem,
    };
  }

  factory PatientDetail.fromMap(Map<String, dynamic> map) {
    return PatientDetail(
      patientName: map['patientName'],
      patientGender: map['patientGender'],
      patientAge: map['patientAge'],
      patientProblem: map['patientProblem'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientName': patientName,
      'patientGender': patientGender,
      'patientAge': patientAge,
      'patientProblem': patientProblem,
    };
  }
}
