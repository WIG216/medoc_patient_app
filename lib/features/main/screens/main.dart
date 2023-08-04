import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/features/appointment/screens/my_appointment_screen.dart';
import 'package:medoc_patient_app/features/main/controllers/navigation_controller.dart';
import 'package:medoc_patient_app/features/main/screens/home_screen.dart';
import 'package:medoc_patient_app/features/medical_bot/screens/chat_screen.dart';
import 'package:medoc_patient_app/features/pharma/screens/pharmacy_screen.dart';
import 'package:medoc_patient_app/features/settings/screens/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final BottomNavigationController bottomNavigationController = Get.find();

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        // return  AppointmentScreen();
        return MyAppointmentsScreen();
      case 2:
        return MapScreen();
      case 3:
        return ChatScreen();
      case 4:
        return UserProfileScreen();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _getPage(bottomNavigationController.selectedIndex.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomNavigationController.selectedIndex.value,
          onTap: bottomNavigationController.onItemTapped,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          iconSize: 20,
          unselectedItemColor: Colors.grey,
          selectedItemColor: lightPrimaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pharmacy_outlined),
              label: 'Pharmacy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              label: 'Medical Bot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined),
              label: 'My Profile',
            ),
          ],
        ),
      ),
    );
  }
}
