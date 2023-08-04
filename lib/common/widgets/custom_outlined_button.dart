import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 10),
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
