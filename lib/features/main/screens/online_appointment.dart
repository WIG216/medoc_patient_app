import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineAppointment extends StatelessWidget {
  const OnlineAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        title: Text(
          "Appointment",
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
      
      // body: ,
    );
  }
}