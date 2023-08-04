import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';

class InputField extends StatefulWidget {
  final String hintText;
  String? Function(String?)? validator;
  final Function(String)? onChange;
  final keyboardType;
  final TextEditingController? controller;
  final IconData? prefixIcon;

  InputField({
    super.key,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.controller,
    this.onChange,
     this.prefixIcon,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 14,
      ),
      onChanged: widget.onChange,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 12,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        hintText: widget.hintText,
        errorBorder: OutlineInputBorder(
          gapPadding: 50,
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
