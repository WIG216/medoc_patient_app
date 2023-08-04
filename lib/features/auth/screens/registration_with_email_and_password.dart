import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/auth/controllers/auth_controller.dart';
import 'package:medoc_patient_app/routes.dart';
import '../../../common/utils/colors.dart';
import '../widgets/input_field.dart';

class RegisterWithEmailAndPassword extends StatefulWidget {
  const RegisterWithEmailAndPassword({super.key});

  @override
  State<RegisterWithEmailAndPassword> createState() =>
      _RegisterWithEmailAndPasswordState();
}

class _RegisterWithEmailAndPasswordState
    extends State<RegisterWithEmailAndPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authService = Get.find<AuthController>();

  final loading = false.obs;

  Future<void> _onValidation() async {
    if (_formKey.currentState!.validate()) {
      loading.value = true;

      await _authService.signInWithEmailAndPassword(
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
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
    if (!emailValid) {
      return 'Enter Valid Email';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset('assets/images/registration.svg'),
            ),
            8.height,
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to Medoc",
                    style: largeHeadereStyle,
                  ),
                  Text(
                    "Let's create your account",
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
            32.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              height: 50,
              child: ElevatedButton(
                onPressed: _onValidation,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
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
                              "Create Account",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8.0),
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
                  Get.toNamed(AppRoutes.login);
                },
                child: RichText(
                  textScaleFactor: 0.8,
                  text: const TextSpan(
                    text: "Do you already have an acccount? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
            ),
          ],
        ),
      ),
    );
  }
}
