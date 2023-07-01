import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

class HelpingScreen extends StatelessWidget {
  HelpingScreen({super.key});
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        title: Text(
          "Help",
          style: largeHeadereStyle.copyWith(color: Colors.black54),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          children: [
            24.height,
            TextField(
              controller: textController,
              maxLines: 10,
              style: TextStyle(
                color: Colors.grey,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                ),
                hintText: 'Type your message',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor.withOpacity(0.4),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            16.height,
            Text(
              "Fill out the form above to send an email and one of our team members will address your question as soon as possible",
              // style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.6),
              style: subtitleStyle.copyWith(height: 1.6, fontSize: 15,),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 50,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () => print(textController.text),
            child: Text(
              "Send mail",
              style: smallHeaderStyle.copyWith(
                fontSize: 15,
                color: whiteColor,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
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
