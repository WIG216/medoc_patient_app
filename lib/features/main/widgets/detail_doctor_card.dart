import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

class DetailDoctorCard extends StatelessWidget {
  final String doctorName, speciality;
  const DetailDoctorCard({
    Key? key, required this.doctorName, required this.speciality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        elevation: 0.8,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: smallHeaderStyle,
                    //   style: TextStyle(
                    //       color: Color(MyColors.header01),
                    //       fontWeight: FontWeight.w700),
                    ),
                    8.height,
                    Text(
                      speciality,
                      style: subtitleStyle.copyWith(fontWeight: FontWeight.w500,),
                      // style: TextStyle(
                      //   color: Color(MyColors.grey02),
                      //   fontWeight: FontWeight.w500,
                      // ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: AssetImage('assets/doctor01.jpeg'),
                  width: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
