import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/enum/appointment_package.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/routes.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';


class DropdownController extends GetxController {
  RxString selectedValue = RxString('1');

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}

class PackageScreen extends StatefulWidget {
  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  BookingController _bookingController = Get.find();
  final DropdownController dropdownController = Get.put(DropdownController());
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: '1',
        child: Row(
          children: [
            Icon(
              CupertinoIcons.clock_fill,
              color: textColor,
            ),
            12.width,
            Text(
              "30 Minutes",
              style: bodyStyle,
            ),
          ],
        ),
      ),
      DropdownMenuItem(
        value: '2',
        child: Row(
          children: [
            Icon(
              CupertinoIcons.clock_fill,
              color: textColor,
            ),
            12.width,
            Text(
              "45 Minutes",
              style: bodyStyle,
            ),
          ],
        ),
      ),
      DropdownMenuItem(
        value: '3',
        child: Row(
          children: [
            Icon(
              CupertinoIcons.clock_fill,
              color: textColor,
            ),
            12.width,
            Text(
              "1 hour",
              style: bodyStyle,
            ),
          ],
        ),
      ),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        title: Text(
          "Select Package",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              14.height,
              Text(
                "Select Duration",
                style: mediumHeaderStyle,
              ),
              8.height,
              SizedBox(
                height: 45,
                child: DropdownButtonFormField<String>(
                  
                  elevation: 0,
                  value: dropdownController.selectedValue.value,
                  items: dropdownItems,
                  onChanged: (value) {
                    dropdownController.setSelectedValue(value!);
                    print(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(144, 239, 239, 239),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              16.height,
              Text(
                "Select Package",
                style: mediumHeaderStyle,
              ),
              8.height,
              SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: packageItems.length,
                    itemBuilder: (context, index) {
                      final packageItem = packageItems[index];
                      return PackageCard(
                        icon: packageItem['icon'],
                        price: packageItem['price'],
                        subtitle: packageItem['subtitle'],
                        time: packageItem['time'],
                        title: packageItem['title'],
                        value: packageItem['value'],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 40,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(AppRoutes.patient_detail),
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

class PackageCard extends StatefulWidget {
  final IconData icon;
  final String title, subtitle, price, time;
  final Package value;

  const PackageCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.time,
    required this.value,
  });

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  BookingController packageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: lightBgColor.withOpacity(.2),
        radius: 20,
        child: Icon(
          widget.icon,
          color: primaryColor,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: smallHeaderStyle,
          ),
          Text(
            widget.price,
            style: smallHeaderStyle.copyWith(
              color: primaryColor,
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.subtitle,
            style: subtitleStyle,
          ),
          Text(
            widget.time,
            style: subtitleStyle,
          ),
        ],
      ),
      
      trailing: Obx(
        () => Radio<Package>(
          value: widget.value,
          groupValue: packageController.selectedPackage.value,
          onChanged: (Package? value) {
            packageController.selectPackage(value);
          },
        ),
      ),
    );
  
  }
}

List packageItems = [
  {
    'icon': CupertinoIcons.chat_bubble_2_fill,
    "title": "Messaging",
    "price": "1000",
    "subtitle": "Chat messages with doctor",
    "time": "/30 mins",
    "value": Package.messages,
  },
  {
    'icon': CupertinoIcons.phone_fill,
    "title": "Voice Call",
    "price": "1200",
    "subtitle": "Voice call with doctor",
    "time": "/30 mins",
    "value": Package.voiceCall,
  },
  {
    'icon': CupertinoIcons.video_camera_solid,
    "title": "Video Call",
    "price": "2000",
    "subtitle": "Video call with doctor",
    "time": "/30 mins",
    "value": Package.videoCall,
  },
  {
    'icon': Icons.home,
    "title": "Home Visite",
    "price": "3000",
    "subtitle": "Doctor will visite you",
    "time": "/30 mins",
    "value": Package.homeVisit,
  },
];
