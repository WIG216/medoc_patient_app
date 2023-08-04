import 'package:get/get.dart';
import 'package:medoc_patient_app/features/appointment/screens/appointment_detail.dart';
import 'package:medoc_patient_app/features/appointment/screens/appointment_screen.dart';
import 'package:medoc_patient_app/features/appointment/screens/my_appointment_screen.dart';
import 'package:medoc_patient_app/features/appointment/screens/patient_detail_screen.dart';
import 'package:medoc_patient_app/features/appointment/screens/payment_screen.dart';
import 'package:medoc_patient_app/features/appointment/screens/reschedule_appointment_screen.dart';
import 'package:medoc_patient_app/features/appointment/screens/reschedule_appointment_screen_0.dart';
import 'package:medoc_patient_app/features/appointment/screens/review_summary_screen.dart';
import 'package:medoc_patient_app/features/appointment/screens/select_package_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/login_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/registration_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/registration_with_email_and_password.dart';
import 'package:medoc_patient_app/features/auth/screens/user_information_screen.dart';
import 'package:medoc_patient_app/features/auth/screens/verification_screen.dart';
import 'package:medoc_patient_app/features/main/screens/ambulance_screen.dart';
import 'package:medoc_patient_app/features/main/screens/doctor_detail_screen.dart';
import 'package:medoc_patient_app/features/main/screens/faq_screen.dart';
import 'package:medoc_patient_app/features/main/screens/help_screen.dart';
import 'package:medoc_patient_app/features/main/screens/hospitals_screen.dart';
import 'package:medoc_patient_app/features/main/screens/main.dart';
import 'package:medoc_patient_app/features/main/screens/medical_post_screen.dart';
import 'package:medoc_patient_app/features/main/screens/pill_screen.dart';
import 'package:medoc_patient_app/features/pharma/widgets/search_sheet.dart';

class AppRoutes {
  static const String home = '/';
  static const String registration = '/register';
  static const String registrationWithEmailAndPassword = '/registerW';
  static const String login = '/login';
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
  static const String medicalPost = '/medical_post';
  static const String help = '/help';
  static const String faqs = '/faqs';
  static const String my_appointment = '/my_appointment';
  static const String appointment_screen = '/appointment/second';
  static const String reschedule_appointment_screen_0 = '/appointment/reschedule/reason';
  static const String reschedule_appointment_screen = '/appointment/reschedule';
  static const String patient_detail = '/appointment/patient_detail';
  static const String payment = '/appointment/payment';
  static const String review = '/appointment/review';
  static const String package = '/appointment/package';
  static const String appointment_detail = '/appointment/detail';



  static final List<GetPage> routes = [
    // GetPage(name: home, page: () => PharmarcyMainPage()),
    GetPage(name: home, page: () => const MainPage()),
    // GetPage(name: registrationWithEmailAndPassword, page: () => const RegisterWithEmailAndPassword()),
    GetPage(name: login, page: () =>  LoginScreen()),
    GetPage(name: registrationWithEmailAndPassword, page: () => const RegisterWithEmailAndPassword()),
    GetPage(name: hospitals, page: () => const HospitalScreen()),
    // GetPage(name: appointments, page: () => AppointmentScreen()),
    GetPage(name: ambulance, page: () => const AmbulanceScreen()),
    GetPage(name: medicalPost, page: () => const MedicalPostScreen()),
    GetPage(name: pill, page: () => const PillScreen()),
    GetPage(name: registration, page: () => RegistrationScreen()),
    GetPage(name: verifyPhoneNumber, page: () => const VerificationScreen()),
    GetPage(name: user_information_screen, page: () => const UserInformationScreen()),
    // GetPage(name: map_page, page: () => MapPage()),
    // GetPage(name: menu_sheet, page: () => MenuSheet()),
    GetPage(name: search_sheet, page: () => SearchSheet()),
    GetPage(name: doctor_detail, page: () => const SliverDoctorDetail()),
    GetPage(name: help, page: () => HelpingScreen()),
    GetPage(name: faqs, page: () => FAQsScreen()),
    GetPage(name: my_appointment, page: () => const MyAppointmentsScreen()),
    GetPage(name: appointment_screen, page: () => AppointmentScreen()),
    GetPage(name: reschedule_appointment_screen_0, page: () => const RescheduleAppointmentFirstScreen()),
    GetPage(name: reschedule_appointment_screen, page: () => const RescheduleAppointment()),
    GetPage(name: patient_detail, page: () => const PatientDetailScreen()),
    GetPage(name: payment, page: () => const PaymentScreen()),
    GetPage(name: review, page: () => const ReviewSummaryScreen()),
    GetPage(name: package, page: () => PackageScreen()),
    GetPage(name: appointment_detail, page: () => const ViewAppointment()),
  ];
}
