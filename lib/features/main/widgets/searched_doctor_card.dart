import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

class SearchedDoctorCard extends StatelessWidget {
  const SearchedDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/doctor01.jpeg",
              // height: 150,
              // width: 100,
            ),
          ),
          12.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dr. Jenny Wotson",
                    style: mediumHeaderStyle,
                  ),
                  52.width,
                  Icon(
                    CupertinoIcons.suit_heart,
                    color: primaryColor,
                  ),
                ],
              ),
              4.height,
              Text(
                "Cardiogist | General hospital",
                style: bodyStyle,
              ),
              8.height,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star_half_rounded,
                    color: primaryColor,
                  ),
                  Text(
                    "4.4 (6 reviews)",
                    style: subtitleStyle.copyWith(color: textColor),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
