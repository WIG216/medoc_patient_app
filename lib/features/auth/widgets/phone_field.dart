import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';

class NPhoneNumberInput extends StatelessWidget {
  const NPhoneNumberInput({
    super.key,
    this.onInputChanged,
    this.validator,
    this.initialValue,
    this.controller,
    this.isEnabled = false,
    this.errorMessage,
  });

  final Function(PhoneNumber)? onInputChanged;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final PhoneNumber? initialValue;
  final TextEditingController? controller;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Country code",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            // fontWeight: FontWeight.w600,
          ),
        ),
        2.height,
        Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.black.withOpacity(0.1),
          //     width: 0.5,
          //   ),
          //   color: Colors.grey.withOpacity(0.5),
          //   borderRadius: BorderRadius.circular(12),
          // ),
          padding: const EdgeInsets.only(left: 0, right: 2),
          width: Get.width,
          child: InternationalPhoneNumberInput(
            onInputChanged: onInputChanged,
            validator: validator,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            isEnabled: isEnabled,
            inputDecoration: InputDecoration(
              
              // border: InputBorder.none,
              hintText: "Mobile number",
              errorText: errorMessage,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            ignoreBlank: false,
            selectorTextStyle: const TextStyle(
              color: Colors.black,
            ),
            initialValue: initialValue ?? PhoneNumber(isoCode: 'CM'),
            textFieldController: controller,
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
          ),
        )
      ],
    );
  }
}
