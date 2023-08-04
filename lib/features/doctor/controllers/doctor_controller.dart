import 'package:get/get.dart';
import 'package:medoc_patient_app/features/doctor/repositories/doctor_repository.dart';
import 'package:medoc_patient_app/models/doctor_model.dart';

class DoctorController extends GetxController {
  final DoctorRepository _repository = DoctorRepository();
  final RxList<Doctor> doctorsData = <Doctor>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() {
    _repository.getDoctors().listen((doctors) {
      doctorsData.assignAll(doctors);
    });
  }
}
