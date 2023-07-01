import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medoc_patient_app/common/enum/appointment_package.dart';
import 'package:medoc_patient_app/common/enum/appointment_period.dart';
import 'package:medoc_patient_app/common/enum/payment_option.dart';
import 'package:medoc_patient_app/common/enum/reschedule_appointment_reason.dart';

class AppointmentController extends GetxController {
  RxString activeTime = "".obs;
  RxList feesInfo = [].obs;
  Rx<FilterStatus> status = FilterStatus.Morning.obs;

  late String filterStatus = status.value.toString();
  late String morning = filterStatus.split('.').last;

  void updateActiveTime(String newActiveTime) {
    activeTime.value = newActiveTime;
  }

  void updatedFeesInformation(List selectedFees) {
    feesInfo.value = selectedFees;
  }

  void updateStatus(FilterStatus newStatus) {
    status.value = newStatus;
  }

  void onSubmit() {
    print(activeTime);
    print(feesInfo);
    print(morning);
  }
}

// import 'package:get/get.dart';

