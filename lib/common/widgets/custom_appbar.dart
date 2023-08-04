import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      title: Text(
        title,
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
        child: CustomIconButton(
          icon:  Icons.arrow_back,
          onPressed: Get.back,
        ),
      ),
    );
  }
}

