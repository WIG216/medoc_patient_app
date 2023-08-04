import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  String name;
  DateTime? dateOfBirth;
  String gender;
  String phoneNumber;
  String emailAddress;
  String address;
  String medicalLicense;
  String speciality;
  String qualifications;
  int yearsOfExperience;
  String clinicName;
  String clinicAddress;
  String clinicContact;
  List<String> workDays;
  List<String> workHours;
  String uid;
  bool isOnline;
  String profilePic;

  Doctor({
    required this.name,
    required this.phoneNumber,
    this.dateOfBirth,
    required this.gender,
    required this.emailAddress,
    required this.address,
    required this.medicalLicense,
    required this.speciality,
    required this.qualifications,
    required this.yearsOfExperience,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicContact,
    required this.workDays,
    required this.workHours,
    required this.uid,
    required this.isOnline,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'emailAddress': emailAddress,
      'address': address,
      'medicalLicense': medicalLicense,
      'yearsOfExperience': yearsOfExperience,
      'qualification': qualifications,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'clinicName': clinicName,
      'clinicAddress': clinicAddress,
      'clinicContact': clinicContact,
      'workDays': workDays,
      'workHours': workHours,
      'speciality': speciality,
      'profilePic': profilePic,
      'uid': uid,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    Timestamp? dobTimestamp = map['dateOfBirth'];
    DateTime? dob = dobTimestamp != null ? dobTimestamp.toDate() : null;

    return Doctor(
      name: map['name'],
      dateOfBirth: dob,
      gender: map['gender'],
      emailAddress: map['emailAddress'],
      address: map['address'],
      medicalLicense: map['medicalLicense'],
      yearsOfExperience: map['yearsOfExperience'],
      qualifications: map['qualification'],
      clinicName: map['clinicName'],
      clinicAddress: map['clinicAddress'],
      clinicContact: map['clinicContact'],
      isOnline: map['isOnline'] ?? false,
      phoneNumber: map['phoneNumber'],
      speciality: map['speciality'],
      workDays: List<String>.from(map['workDays']),
      workHours: List<String>.from(map['workHours']),
      uid: map['uid'],
      profilePic: map['profilePic'] ?? "",
    );
  }
}
