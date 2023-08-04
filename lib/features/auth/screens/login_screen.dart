import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/auth/widgets/input_field.dart';
import 'package:medoc_patient_app/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  void _onValidation() {
    if (_formKey.currentState!.validate()) {}
  }

  _usernameVerification(value) {
    if (value!.isEmpty) {
      return 'Enter Username';
    }
    if (value.length < 3) {
      return 'Username should be greater than 3';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset('assets/images/login-bg.png'),
            ),
            8.height,
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back!",
                    style: largeHeadereStyle,
                  ),
                  Text(
                    "Log into your existing account",
                    style: subtitleStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            12.height,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 14),
                  ),
                  4.height,
                  InputField(
                    hintText: 'Username',
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    prefixIcon: CupertinoIcons.person,
                    validator: (value) => _usernameVerification(value),
                  ),
                  12.height,
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 14),
                  ),
                  4.height,
                  InputField(
                    hintText: '******',
                    prefixIcon: CupertinoIcons.lock,
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    // validator: (value) => _usernameVerification(value),
                  ),
                ],
              ),
            ),
            4.height,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forgot Password",
                style: smallHeaderStyle,
              ),
            ),
            12.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              height: 40,
              child: ElevatedButton(
                onPressed: _onValidation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Complete Registration",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                        width: 8.0), // Adjust the spacing between text and icon
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                  ],
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
            8.height,
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.registrationWithEmailAndPassword);
              },
              child: RichText(
                textScaleFactor: 0.8,
                text: const TextSpan(
                  text: "Do you already have an acccount? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign in here',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
