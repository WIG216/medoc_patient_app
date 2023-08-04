import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/features/main/widgets/number_card.dart';

class DoctorInfo extends StatelessWidget {
  final int experience;
  const DoctorInfo({
    Key? key,
    required this.experience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NumberCard(
          label: 'Patients',
          value: '100+',
        ),
        15.width,
        NumberCard(
          label: 'Experiences',
          value: experience.toString(),
        ),
        15.width,
        NumberCard(
          label: 'Rating',
          value: '4.0',
        ),
      ],
    );
  }
}
