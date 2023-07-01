import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/main/widgets/detail_doctor_card.dart';
import 'package:medoc_patient_app/features/main/widgets/doctor_info.dart';
import 'package:medoc_patient_app/features/main/widgets/doctor_location.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailDoctorCard(),
          15.height,
          DoctorInfo(),
          30.height,
          Text(
            'About Doctor',
            style: smallHeaderStyle,
          ),
          15.height,
          Text(
            'Dr. Joshua Simorangkir is a specialist in internal medicine who specialzed blah blah.',
            // style: TextStyle(
            //   color: Color(MyColors.purple01),
            //   fontWeight: FontWeight.w500,
            //   height: 1.5,
            // ),
            style: subtitleStyle.copyWith(height: 2, fontWeight: FontWeight.w500,),
          ),
          25.height,
          Text(
            'Location',
            style: smallHeaderStyle,
            // style: kTitleStyle,
          ),
          25.height,
          DoctorLocation(),
          // 25.height,
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //       primary: primaryColor,
          //       onPrimary: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12),
          //       )),
          //   child: Text('Book Appointment'),
          //   onPressed: () => {},
          // )
        ],
      ),
    );
  }
}
