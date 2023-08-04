import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/auth/controllers/auth_controller.dart';
import 'package:medoc_patient_app/features/auth/widgets/input_field.dart';
import 'package:medoc_patient_app/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthController _authController = Get.find();

  final loading = false.obs;

  void _onValidation() async {
    if (_formKey.currentState!.validate()) {
      loading.value = true;
      
      await _authController.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      loading.value = false;
    }
  }

  _emailVerification(value) {
    if (value!.isEmpty) {
      return 'Enter Email';
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Enter Valid Email';
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
            16.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 14),
                    ),
                    4.height,
                    InputField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.name,
                      prefixIcon: CupertinoIcons.person,
                      validator: (value) => _emailVerification(value),
                    ),
                    16.height,
                    const Text(
                      "Password",
                      style: TextStyle(fontSize: 14),
                    ),
                    4.height,
                    InputField(
                      hintText: '******',
                      prefixIcon: CupertinoIcons.lock,
                      controller: passwordController,
                      keyboardType: TextInputType.name,
                      // validator: (value) => _usernameVerification(value),
                    ),
                  ],
                ),
              ),
            ),
            12.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password ?",
                  style: bodyStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            32.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              height: 50,
              child: ElevatedButton(
                onPressed: _onValidation,
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Obx(
                  () => loading.value
                      ? const CupertinoActivityIndicator(
                          color: Colors.white,
                          radius: 16,
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ), // Adjust the spacing between text and icon
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                            ),
                          ],
                        ),
                ),
              ),
            ),
            12.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.registrationWithEmailAndPassword);
                },
                child: RichText(
                  textScaleFactor: 0.8,
                  text: const TextSpan(
                    text: "Don't have an acccount? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register here',
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
            ),
          ],
        ),
      ),
    );
  }
}
