import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/appointment/screens/appointment_screen.dart';
import 'package:medoc_patient_app/features/main/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';


class RescheduleAppointment extends StatefulWidget {
  const RescheduleAppointment({super.key});

  @override
  State<RescheduleAppointment> createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends State<RescheduleAppointment> {
    BookingController _bookingController = Get.find();

    List Time = ["9:00AM", "10:00AM", "11:30AM", "12:00PM", "1:00PM"];
     _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    _bookingController.setSelectedDate(args.value);
  }

  _onSelected(selectedIndex) {
    _bookingController.setActiveIndex(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Reschedule Appointment",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: OutlinedButton(
            onPressed: Get.back,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              side: BorderSide(color: Colors.black45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
        ),
      ),
    body: Obx(() {
        final selectedDate = _bookingController.selectedDate.value;
        final activeIndex = _bookingController.activeIndex.value;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: ListView(
            children: [
              12.height,
              Text(
                "Select Date",
                style: mediumHeaderStyle,
              ),
              8.height,
              Container(
                height: 300,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: lightBgColor.withOpacity(0.2),
                ),
                child: SfDateRangePicker(
                  showNavigationArrow: true,
                  enablePastDates: false,
                  minDate: DateTime.now(),
                  onSelectionChanged: _onSelectionChanged,
                  allowViewNavigation: true,
                ),
              ),
              12.height,
              Text(
                "Select Hour",
                style: mediumHeaderStyle,
              ),
              8.height,
              SizedBox(
                height: 100,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 2,
                  ),
                  itemCount: Time.length,
                  itemBuilder: (context, index) {
                    final time = Time[index];

                    return SelectableTime(
                      time: time,
                      index: index,
                      activeIndex: activeIndex,
                      onSelected: _onSelected,
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
     
    bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 20,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(
              "Submit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    
    );
  }
}