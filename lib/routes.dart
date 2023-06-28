import 'package:get/get.dart';
import 'package:medoc_patient_app/features/auth/screens/registration_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/user_information_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/verification_screen.dart';
import 'package:medoc_patient_app/features/auth/widgets/doctor_detail.dart';
import 'package:medoc_patient_app/features/auth/widgets/home.dart';
import 'package:medoc_patient_app/features/main/screens/ambulance_screen.dart';
import 'package:medoc_patient_app/features/main/screens/appointment.dart';
import 'package:medoc_patient_app/features/main/screens/appointment_screen.dart';
import 'package:medoc_patient_app/features/main/screens/doctor_detail_screen.dart';
import 'package:medoc_patient_app/features/main/screens/faq_screen.dart';
import 'package:medoc_patient_app/features/main/screens/help_screen.dart';
import 'package:medoc_patient_app/features/main/screens/hospitals_screen.dart';
import 'package:medoc_patient_app/features/main/screens/main.dart';
import 'package:medoc_patient_app/features/main/screens/medical_post_screen.dart';
import 'package:medoc_patient_app/features/main/screens/pill_screen.dart';
import 'package:medoc_patient_app/features/pharmacy/screens/map.dart';
import 'package:medoc_patient_app/features/pharmacy/screens/menu_sheet.dart';
import 'package:medoc_patient_app/features/pharmacy/screens/searchSheet.dart';

class AppRoutes {
  static const String home = '/';
  static const String registration = '/register';
  static const String verifyPhoneNumber= '/verifyOTP';
  // static const String home = '/';
  
  // static const String main_page = '/main_page';
  static const String map_page = '/map_page';
  static const String menu_sheet = '/menu_sheet';
  static const String search_sheet = '/search_sheet';
  static const String verification_screen = '/verifyOTP';
  static const String user_information_screen =  '/user_information';
  static const String doctor_detail = '/doctor/detail';
  static const String hospitals = '/hospitals';
  static const String appointments = '/appointment';
  static const String ambulance= '/ambulance';
  static const String pill = '/pill';
  static const String medical_post = '/medical_post';
  static const String help = '/help';
  static const String faqs = '/faqs';
  static const String appointment = '/booking';



  static final List<GetPage> routes = [
    // GetPage(name: home, page: () => PharmarcyMainPage()),
    GetPage(name: home, page: () => MainPage()),
    GetPage(name: hospitals, page: () => HospitalScreen()),
    GetPage(name: appointments, page: () => AppointmentScreen()),
    GetPage(name: ambulance, page: () => AmbulanceScreen()),
    GetPage(name: medical_post, page: () => MedicalPostScreen()),
    GetPage(name: pill, page: () => PillScreen()),
    GetPage(name: registration, page: () => RegistrationScreen()),
    GetPage(name: verifyPhoneNumber, page: () => VerificationScreen()),
    GetPage(name: user_information_screen, page: () => UserInformationScreen()),
    GetPage(name: map_page, page: () => MapPage()),
    GetPage(name: menu_sheet, page: () => MenuSheet()),
    GetPage(name: search_sheet, page: () => SearchSheet()),
    GetPage(name: doctor_detail, page: () => SliverDoctorDetail()),
    GetPage(name: help, page: () => HelpingScreen()),
    GetPage(name: faqs, page: () => FAQsScreen()),
    GetPage(name: appointment, page: () => Appointment()),
  ];
}
