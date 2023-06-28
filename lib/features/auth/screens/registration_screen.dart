import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/snack_bar.dart';
import 'package:medoc_patient_app/features/auth/controllers/auth_controller.dart';
import 'package:medoc_patient_app/features/auth/widgets/input_field.dart';
import 'package:medoc_patient_app/features/auth/widgets/phone_field.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final AuthController authController = Get.find();
  final TextEditingController mobileNumberController = TextEditingController();

  // PhoneNumber? phoneNumber;

  // void onInputChanged(PhoneNumber number) {
  //   authController.updatePhoneNumber(number.phoneNumber);
  // }
  void sendPhoneNumber() {
    String phoneNumber = mobileNumberController.text.trim();
    if (phoneNumber.isNotEmpty) {
      authController.signInWithPhone(context, '+237$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Fill out all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // 5.height,
          SvgPicture.asset(
            "assets/images/registration.svg",
            height: 400,
          ),
          // 12.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your mobile number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                4.height,
                Text(
                  "Please confirm your country code and enter your mobile number",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                24.height,
                NPhoneNumberInput(
                  isEnabled: true,
                  controller: mobileNumberController,
                  onInputChanged: (PhoneNumber number) {
                    authController.updatePhoneNumber(number.phoneNumber);
                  },
                ),
                32.height,
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    // onPressed: () => authController.signInWithPhone(authController.phoneNumber.value),
                    onPressed: sendPhoneNumber,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
