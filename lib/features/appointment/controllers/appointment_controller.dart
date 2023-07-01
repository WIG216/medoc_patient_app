import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medoc_patient_app/common/enum/appointment_package.dart';
import 'package:medoc_patient_app/common/enum/payment_option.dart';
import 'package:medoc_patient_app/common/enum/reschedule_appointment_reason.dart';

class BookingController extends GetxController {
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxInt activeIndex = RxInt(-1);
  List Time = ["9:00AM", "10:00AM", "11:30AM", "12:00PM", "1:00PM"];
  RxString choosenDate = "".obs;
  RxString choosenTime = "".obs;
  var selectedPackage = Package.messages.obs;
  var selectedPayment = Payment.mtn.obs;
  var selectedGender = "".obs;
  var selectedRescheduleReason = RescheduleReason.scheduleClash.obs;
  var selectedDuration = "".obs;

  void selectGender(String value) {
    selectedGender.value = value;
  }

  void selectPackage(Package? value) {
    selectedPackage.value = value!;
  }

  void selectPayment(Payment? value) {
    selectedPayment.value = value!;
  }

  void selectRescheduleReason(RescheduleReason? value) {
    selectedRescheduleReason.value = value!;
    print(selectedRescheduleReason.value);
  }

  void setSelectedDate(DateTime? date) {
    selectedDate.value = date;
    if (selectedDate.value != null) {
      String formattedDate =
          DateFormat('E d MMMM yyyy').format(selectedDate.value!);
      choosenDate.value = formattedDate;
    }
  }

  void setActiveIndex(int index) {
    activeIndex.value = index;
    String selectedTime = Time[activeIndex.value];
    choosenTime.value = selectedTime;
  }

  void onSubmit() {
    print(choosenDate);
    print(choosenTime);
    print(selectedPackage);
    print(selectedPayment);
  }
}
