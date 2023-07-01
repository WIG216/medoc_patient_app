import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/main/widgets/detail_body.dart';
import 'package:medoc_patient_app/routes.dart';

class SliverDoctorDetail extends StatelessWidget {
  const SliverDoctorDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),),
            backgroundColor: primaryColor,
            expandedHeight: 130,
            flexibleSpace: Stack(
              children: [
                // Background image or color
                FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/hospital.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay content
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5), // Overlay color
                    // Overlay content here
                    child: Center(
                      child: Text(
                        'Doctor Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: DetailBody(),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 10,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: ()=>Get.toNamed(AppRoutes.appointment),
            child: Text(
              "Book Appointment",
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






