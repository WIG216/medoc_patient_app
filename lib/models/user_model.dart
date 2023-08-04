import 'package:cloud_firestore/cloud_firestore.dart';

class Patient {
  String fullName;
  DateTime? dateOfBirth;
  String gender;
  String phoneNumber;
  String emailAddress;
  double weight;
  String bloodGroup;
  String emergencyContact;
  String emergencyContactName;
  String uid;
  bool isOnline;
  String profilePic;

  Patient({
    required this.fullName,
    required this.phoneNumber,
    this.dateOfBirth,
    required this.gender,
    required this.emailAddress,
    required this.weight,
    required this.bloodGroup,
    required this.emergencyContact,
    required this.isOnline,
    required this.emergencyContactName,
    required this.uid,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'bloodGroup': bloodGroup,
      'emailAddress': emailAddress,
      'emergencyContact': emergencyContact,
      'emergencyContactName': emergencyContactName,
      'dateOfBirth': dateOfBirth,
      'fullName': fullName,
      'gender': gender,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'profilePic': profilePic,
      'weight': weight,
      'uid': uid,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    Timestamp? dobTimestamp = map['dateOfBirth'];
    DateTime? dob = dobTimestamp != null ? dobTimestamp.toDate() : null;

    return Patient(
      fullName: map['fullName'],
      phoneNumber: map['phoneNumber'],
      dateOfBirth: dob,
      gender: map['gender'],
      emailAddress: map['emailAddress'],
      weight: map['weight'],
      bloodGroup: map['bloodGroup'],
      emergencyContact: map['emergencyContact'],
      emergencyContactName: map['emergencyContactName'],
      isOnline: map['isOnline'] ?? false,
      uid: map['uid'],
      profilePic: map['profilePic'] ?? "",
    );
  }
}
