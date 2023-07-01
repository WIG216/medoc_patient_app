import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightPrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Icon(
            Icons.calendar_today,
            color: whiteColor,
            size: 15,
          ),
          5.width,
          Text(
            'Mon, July 29',
            style: TextStyle(color: whiteColor),
          ),
          20.width,
          Icon(
            Icons.access_alarm,
            color: whiteColor,
            size: 17,
          ),
          5.width,
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
