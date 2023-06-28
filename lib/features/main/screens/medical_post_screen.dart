import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalPostScreen extends StatelessWidget {
  const MedicalPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}