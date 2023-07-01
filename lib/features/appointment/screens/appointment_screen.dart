import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
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
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        title: Text(
          "Book Appointment",
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
          vertical: 40,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.package),
            child: Text(
              "Next",
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

class SelectableTime extends StatefulWidget {
  final String time;
  final int index;
  final int activeIndex;
  final ValueChanged<int> onSelected;

  const SelectableTime({
    Key? key,
    required this.time,
    required this.index,
    required this.activeIndex,
    required this.onSelected,
  }) : super(key: key);

  @override
  _SelectableTimeState createState() => _SelectableTimeState();
}

class _SelectableTimeState extends State<SelectableTime> {
  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.index == widget.activeIndex;

    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
        ),
        child: Text(
          widget.time,
          style: bodyStyle.copyWith(
            color: isActive ? Colors.white : primaryColor,
          ),
        ),
      ),
    );
  }
}
