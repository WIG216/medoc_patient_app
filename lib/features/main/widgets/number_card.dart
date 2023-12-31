import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

class NumberCard extends StatelessWidget {
  final String label;
  final value;

  const NumberCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFF8ab6be).withOpacity(0.2),

          // color: Color(MyColors.bg03),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: subtitleStyle,
              // style: TextStyle(
              //   color: Color(MyColors.grey02),
              //   fontSize: 12,
              //   fontWeight: FontWeight.w600,
              // ),
            ),
            10.height,
            Text(
              value,
              style: bodyStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15,),
              // style: TextStyle(
              //   color: Color(MyColors.header01),
              //   fontSize: 15,
              //   fontWeight: FontWeight.w800,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
