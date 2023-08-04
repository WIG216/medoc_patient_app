import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/main/widgets/detail_doctor_card.dart';
import 'package:medoc_patient_app/features/main/widgets/doctor_info.dart';
import 'package:medoc_patient_app/features/main/widgets/doctor_location.dart';

class DetailBody extends StatelessWidget {
  final String location, doctorName, speciality;
  final int experience;
  const DetailBody({
    Key? key,
    required this.location,
    required this.doctorName,
    required this.speciality,
    required this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailDoctorCard(
            doctorName: doctorName,
            speciality: speciality,
          ),
          15.height,
          DoctorInfo(
            experience: experience,
          ),
          30.height,
          Text(
            'About Doctor',
            style: smallHeaderStyle,
          ),
          15.height,
          Text(
            'Dr. Geek is an Orthophoniste doctor who specializes in the field of speech and language therapy. With a deep understanding of communication disorders and speech-related difficulties, Dr. Geek provides comprehensive evaluation, diagnosis, and treatment to patients of all ages. ',
            style: subtitleStyle.copyWith(
              height: 2,
              fontWeight: FontWeight.w500,
            ),
          ),
          25.height,
          Text(
            location,
            style: smallHeaderStyle,
          ),
          25.height,
          DoctorLocation(),
        ],
      ),
    );
  }
}
