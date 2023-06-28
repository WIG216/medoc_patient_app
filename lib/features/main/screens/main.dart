import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/features/auth/screens/registration_screen.dart';
import 'package:medoc_patient_app/features/main/controllers/navigation_controller.dart';
import 'package:medoc_patient_app/features/main/screens/appointment_screen.dart';
import 'package:medoc_patient_app/features/main/screens/home_screen.dart';
import 'package:medoc_patient_app/features/main/screens/user_profile.dart';
import 'package:medoc_patient_app/features/pharmacy/screens/pharmarcy_main_sreen.dart';

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
        return  AppointmentScreen();
      case 2:
        return  PharmarcyMainPage();
      case 3:
        return  UserProfile();
      default: 
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _getPage(bottomNavigationController.selectedIndex.value)),
      bottomNavigationBar: Obx (()=>BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavigationController.selectedIndex.value,
        onTap: bottomNavigationController.onItemTapped,
        selectedFontSize:11,
        unselectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        selectedItemColor: lightPrimaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy_outlined),
            label: 'Pharmacy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'My Profile',
          ),
        ],
      ),),
    );
  }
}
