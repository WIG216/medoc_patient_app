class Patient {
  String fullName;
  DateTime dateOfBirth;
  String gender;
  String phoneNumber;
  String emailAddress;
  double weight;
  String bloodGroup;
  String emergencyContact;
  String emergencyContactName;
  String uid;
  bool isOnline;

  Patient({
    required this.fullName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.emailAddress,
    required this.weight,
    required this.bloodGroup,
    required this.emergencyContact,
    required this.isOnline,
    required this.emergencyContactName,
    required this.uid
  });

   Map<String, dynamic> toMap() {
    return {
      'bloodGroup': bloodGroup,
      'emailAdress': emailAddress,
      'emergencyContact': emergencyContact,
      'emergencyContactName': emergencyContactName,
      'dateOfBirth': dateOfBirth,
      'fullName': fullName,
      'gender': gender,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'weight': weight,
      'uid': uid,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      bloodGroup: map['bloodGroup'],
      emailAddress: map['emailAdress'],
      emergencyContact: map['emergencyContact'] ?? '',
      emergencyContactName: map['emergencyContactName'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      fullName: map['fullName'] ?? "",
      gender: map['gender'],
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'] ?? '',
      weight: map['weight'],
      uid: map['uid'],
    );
  }
}
