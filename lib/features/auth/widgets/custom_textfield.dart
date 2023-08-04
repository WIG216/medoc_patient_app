import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    Key? key,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.controller,
    this.hintText,
    this.labelText,
    this.readOnly = false,
    this.validatedField = true,
    this.errorText = 'Cannot be empty',
    this.leadingIcon,
    this.suffixIcon,
    this.obscureText = false, this.maxLength,this.textCapitalization, this.validator,
  }) : super(key: key);

  final bool validatedField;
  final bool readOnly;
  final bool obscureText;
  final Widget? leadingIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final String? hintText;
  final int? maxLength;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final textCapitalization;
  String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: Theme.of(context).colorScheme.secondary,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLength: maxLength,
      validator: validator,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        
        prefixIcon: leadingIcon != null ? leadingIcon : null,
        suffixIcon: suffixIcon != null ? suffixIcon : null,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
        labelText: labelText,
        errorText: validatedField ? null : errorText,
      ),
    );
  }
}