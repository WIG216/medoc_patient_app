import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/app_bindings.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/config/zegocloud.dart';
import 'package:medoc_patient_app/firebase_options.dart';
import 'package:medoc_patient_app/messages.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:medoc_patient_app/test_ui.dart';
import 'package:medoc_patient_app/zegocloud/login_page.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ZIMKit().init(appID: Utils.id, appSign: Utils.SignIn,);
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
      home: LoginPage(),
      // initialRoute: AppRoutes.home,
      // getPages: AppRoutes.routes,
    );
  }
}
