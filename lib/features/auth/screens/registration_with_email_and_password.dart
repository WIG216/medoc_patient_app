import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/enum/auth_status.dart';
import 'package:medoc_patient_app/common/widgets/custom_elevated_button.dart';
import 'package:medoc_patient_app/features/auth/controllers/auth_controller.dart';
import 'package:medoc_patient_app/features/auth/widgets/custom_button.dart';
import 'package:medoc_patient_app/features/auth/widgets/custom_textfield.dart';
import 'package:medoc_patient_app/routes.dart';

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _key = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _authService = Get.find(AuthController());
//   //disposing all text controllers
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         width: size.width,
//         height: size.height,
//         color: Colors.white,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 left: 16.0, right: 16.0, top: 50.0, bottom: 25.0),
//             child: Form(
//               key: _key,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: const Icon(Icons.close),
//                   ),
//                   const SizedBox(height: 70),
//                   const Text(
//                     'Create Account',
//                     style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Open an account with a few details.',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   const Text(
//                     'Name',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   CustomTextField(
//                     hintText: 'Enter your name',
//                     keyboardType: TextInputType.name,
//                     textCapitalization: TextCapitalization.sentences,
//                     validator: (value) =>
//                         Validator.fullNameValidate(value ?? ""),
//                     controller: _nameController,
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Email',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   CustomTextField(
//                     hintText: 'Enter your email',
//                     keyboardType: TextInputType.emailAddress,
//                     textCapitalization: TextCapitalization.none,
//                     validator: (value) => Validator.validateEmail(value ?? ""),
//                     controller: _emailController,
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'Password',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   CustomTextField(
//                     hintText: '******',
//                     obscureText: true,
//                     maxLength: 6,
//                     keyboardType: TextInputType.number,
//                     textCapitalization: TextCapitalization.none,
//                     controller: _passwordController,
//                     validator: (value) =>
//                         Validator.validatePassword(value ?? ""),
//                   ),
//                   const SizedBox(height: 20),
//                   CustomButton(
//                     label: 'CREATE YOUR ACCOUNT',
//                     color: Colors.black,
//                     onPressed: () async {
//                       if (_key.currentState!.validate()) {
//                         LoaderX.show(context);
//                         final _status = await _authService.createAccount(
//                           email: _emailController.text.trim(),
//                           password: _passwordController.text,
//                           name: _nameController.text,
//                         );
//                         if (_status == AuthStatus.successful) {
//                           LoaderX.hide();
//                           Navigator.pushNamed(context, LoginScreen.id);
//                         } else {
//                           LoaderX.hide();
//                           final error =
//                               AuthExceptionHandler.generateErrorMessage(
//                                   _status);
//                           CustomSnackBar.showErrorSnackBar(
//                             context,
//                             message: error,
//                           );
//                         }
//                       }
//                     },
//                     size: size,
//                     textColor: Colors.white,
//                     borderSide: BorderSide.none,
//                   ),
//                   const SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, LoginScreen.id);
//                     },
//                     child: RichText(
//                       textScaleFactor: 0.8,
//                       text: const TextSpan(
//                         text: "Do you already have an acccount? ",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: 'Sign in here',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class RegisterWithEmailAndPassword extends StatefulWidget {
  const RegisterWithEmailAndPassword({super.key});

  @override
  State<RegisterWithEmailAndPassword> createState() =>
      _RegisterWithEmailAndPasswordState();
}

class _RegisterWithEmailAndPasswordState
    extends State<RegisterWithEmailAndPassword> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final AuthController _authService = Get.find();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 50.0, bottom: 25.0),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                  const SizedBox(height: 70),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Open an account with a few details.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'Enter your name',
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.sentences,
                    // validator: (value) =>
                    //     Validator.fullNameValidate(value ?? ""),
                    controller: _nameController,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    // validator: (value) => Validator.validateEmail(value ?? ""),
                    controller: _emailController,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: '******',
                    obscureText: true,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.none,
                    controller: _passwordController,
                    // validator: (value) =>
                    //     Validator.validatePassword(value ?? ""),
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    text: "Create Account",
                    onPressed: () => _authService.registerWithEmailAndPassword(
                      displayName: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
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
          ),
        ),
      ),
    );
  }
}
