import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: primaryColor,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Mon, July 29',
                style: subtitleStyle.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: primaryColor,
                size: 17,
              ),
              5.width,
              Text(
                '11:00 ~ 12:10',
                style: bodyStyle.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
