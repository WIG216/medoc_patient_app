import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/app_bindings.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/features/auth/screens/registration_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/user_information_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/verification_screen.dart';
import 'package:medoc_patient_app/features/auth/widgets/home.dart';
import 'package:medoc_patient_app/features/main/screens/appointment.dart';
import 'package:medoc_patient_app/features/main/screens/main.dart';
import 'package:medoc_patient_app/firebase_options.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: Colors.black45,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      defaultTransition: Transition.fade,
      initialBinding: AppBindings(),
      // home: Appointment(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
