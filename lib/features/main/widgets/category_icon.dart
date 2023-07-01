import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';

List<Map> categories = [
  {'icon': Icons.coronavirus, 'text': 'Covid 19', 'route': '/medical_post'},
  {'icon': Icons.local_hospital, 'text': 'Hospital', 'route': '/hospitals'},
  {'icon': Icons.car_rental, 'text': 'Ambulance', 'route': '/ambulance'},
  {'icon': Icons.local_pharmacy, 'text': 'Pill', 'route': '/pill'},
];

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        for (var category in categories)
          CategoryIcon(
            icon: category['icon'],
            text: category['text'],
            onTap: () => Get.toNamed(category['route']),
          ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;

  CategoryIcon({
    required this.icon,
    required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1,),
        child: Column(
          children: [
            InkWell(
              radius: 20,
              splashColor: primaryColor.withOpacity(0.5),
              splashFactory: InkSplash.splashFactory,
              onTap: onTap,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: lightBgColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    icon,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
           10.height,
            Text(
              text,
              style: subtitleStyle.copyWith(fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    );
  }
}
