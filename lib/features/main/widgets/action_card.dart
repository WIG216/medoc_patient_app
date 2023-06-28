import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';

class ActionCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const ActionCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: primaryColor.withOpacity(0.6),
            radius: 20,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          6.height,
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
