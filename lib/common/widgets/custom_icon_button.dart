import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onPressed;
  final double? verticalPadding;
  final IconData icon;
  const CustomIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: verticalPadding ?? 0,
        ),
        side: BorderSide(color: Colors.black45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: Icon(
        icon,
        color: Colors.black45,
      ),
    );
  }
}
