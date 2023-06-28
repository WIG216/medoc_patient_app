import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  List<Map> listTiles = [
    {
      'icon': Icons.translate,
      'title': 'Language',
      'trailing': "English",
      'route': '/medical_post'
    },
    {
      'icon': CupertinoIcons.chat_bubble_2_fill,
      'title': 'FAQs',
      'trailing': "",
      'route': '/faqs'
    },
    {
      'icon': CupertinoIcons.question_circle_fill,
      'title': 'Help',
      'trailing': "",
      'route': '/help'
    },
  ];

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size.width/100 * 70 ;
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  // color: Colors.blueGrey,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(child: Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          // height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/doctor05.jpeg",
                                scale: 5,
                              ),
                            ),
                            title: Text(
                              "hello!",
                              style: TextStyle(
                                color: lightPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "John Doe",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            trailing: IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor:
                                    Color(0xFF8ab6be).withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.height,
                for (var listTile in listTiles)
                  ProfileListTile(
                    leadingIcon: listTile['icon'],
                    title: listTile['title'],
                    trailing: listTile['trailing'],
                    onPressed: () => Get.toNamed(listTile['route']),
                  ),
              ],
            ),
            size.height,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 13),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout),
                  label: Text("Logout"),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Color(0xFFeb4b74),
                    ),
                    backgroundColor: Color(0xFFeedbe1),
                    primary: Color(0xFFec406b),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String title, trailing;
  final Function() onPressed;
  final IconData leadingIcon;

  const ProfileListTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.onPressed,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFF8ab6be).withOpacity(0.2),
                radius: 25,
                child: Icon(
                  leadingIcon,
                  color: primaryColor,
                ),
              ),
              16.width,
              Text(title),
            ],
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              primary: Colors.grey,
            ),
            child: Row(
              children: [
                Text(
                  trailing,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                8.width,
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
