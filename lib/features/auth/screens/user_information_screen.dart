import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/image_picker.dart';
import 'package:medoc_patient_app/features/auth/controllers/auth_controller.dart';
import 'package:medoc_patient_app/features/auth/widgets/input_field.dart';
import 'package:medoc_patient_app/features/auth/widgets/phone_field.dart';
import 'package:intl/intl.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();
  String? selectedValue = null;
  File? image;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final weightController = TextEditingController();
  final emergencyContactController = TextEditingController();
  final emergencyContactNameController = TextEditingController();

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void _onValidation() {
    if (_formKey.currentState!.validate()) {
      DateTime dateOfBirth = DateTime.parse(dobController.text);
      double weightConverter = double.parse(weightController.text);

      authController.saveUserDataToFirebase(
        context,
        usernameController.text,
        bloodGroupController.text,
        emailController.text,
        emergencyContactController.text,
        emergencyContactNameController.text,
        authController.gender.value,
        weightConverter,
        authController.phoneNumber.value,
        dateOfBirth,
        image,
      );

      List userData = [
        usernameController.text,
        bloodGroupController.text,
        emailController.text,
        emergencyContactController.text,
        emergencyContactNameController.text,
        authController.gender.value,
        weightConverter,
        authController.phoneNumber.value,
        dateOfBirth,
        image
      ];
      print(userData);
    }
  }

  void storeUserData() async {
    // String name = nameController.text.trim();
  }

  _emailVerification(value) {
    if (value!.isEmpty) {
      return 'Enter Email';
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Enter Valid Email';
    }
  }

  _usernameVerification(value) {
    if (value!.isEmpty) {
      return 'Enter Username';
    }
    if (value.length < 3) {
      return 'Username should be greater than 3';
    }
  }

  void datePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            1980), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement

      setState(() {
        dobController.text =
            formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    dobController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  18.height,

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Information',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: primaryColor),
                        ),
                        8.height,
                        Text(
                          "Let's know more about you. These information are very important, please fill them correctly",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  image == null
                      ? const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                          ),
                          radius: 64,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(
                            image!,
                          ),
                          radius: 64,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),

                  30.height,

                  // username
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 14),
                  ),
                  4.height,
                  InputField(
                    hintText: 'Username',
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    validator: (value) => _usernameVerification(value),
                  ),
                  16.height,
                  // email
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 14),
                  ),
                  4.height,
                  InputField(
                    hintText: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _emailVerification(value),
                  ),
                  // DPB and Gender
                  16.height,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date of Birth",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 40,
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                controller:
                                    dobController, //editing controller of this TextField
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 12,
                                  ),
                                  hintText: "Date of Birth",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide(
                                        width: 0.5,
                                        color: primaryColor,
                                      )),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      width: 0.5,
                                      color: primaryColor,
                                    ),
                                  ),
                                  // icon: Icon(Icons.calendar_today), //icon of text field
                                  // labelText: "Enter Date" //label text of field
                                ),
                                readOnly:
                                    true, //set it true, so that user will not able to edit text
                                onTap: datePicker,
                              ),
                            ),
                          ],
                        ),
                      ),
                      8.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 40,
                              child: DropdownButtonFormField(
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 12,
                                  ),
                                  hintText: " Gender",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderSide: BorderSide(color: Colors.blue, width: 2),
                                  //   borderRadius: BorderRadius.circular(20),
                                  // ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide(
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                                items: dropdownItems,
                                elevation: 0,
                                validator: (value) {
                                  value == null
                                      ? "Select a Gender"
                                      : authController.updateGender(value);
                                },
                                dropdownColor: Colors.white,
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  16.height,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Blood Group",
                              style: TextStyle(fontSize: 14),
                            ),
                            4.height,
                            InputField(
                              hintText: "User's Blood Group",
                              controller: bloodGroupController,
                              keyboardType: TextInputType.name,
                            ),
                          ],
                        ),
                      ),
                      8.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(fontSize: 14),
                            ),
                            4.height,
                            InputField(
                              hintText: "User's Weight",
                              controller: weightController,
                              keyboardType: TextInputType.name,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  16.height,
                  Text(
                    "Emergency Contact",
                    style: TextStyle(fontSize: 14),
                  ),
                  4.height,
                  InputField(
                    hintText: 'Emergency Contact',
                    controller: emergencyContactController,
                    keyboardType: TextInputType.name,
                    validator: (value) => _usernameVerification(value),
                  ),
                  16.height,
                  Text(
                    "Emergency Contact Name",
                    style: TextStyle(fontSize: 14),
                  ),
                  4.height,

                  InputField(
                    hintText: 'Emergency Contact Name',
                    controller: emergencyContactNameController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
          ),
          24.height,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            height: 40,
            child: ElevatedButton(
              onPressed: _onValidation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Complete Registration",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                      width: 8.0), // Adjust the spacing between text and icon
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
