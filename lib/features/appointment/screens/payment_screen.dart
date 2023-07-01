import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/enum/payment_option.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/features/appointment/controllers/appointment_controller.dart';

import 'package:medoc_patient_app/features/main/controllers/appointment_controller.dart';
import 'package:medoc_patient_app/routes.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  BookingController _paymentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Payment",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.height,
            Text(
              "Select the payment method you want to use",
              style: bodyStyle,
            ),
            12.height,
            SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: paymentOptions.length,
                  itemBuilder: (context, index) {
                    final paymentOption = paymentOptions[index];
                    print(paymentOption['image']);
                    return PaymentCard(
                      image: paymentOption['image'],
                      title: paymentOption['title'],
                      value: paymentOption['value'],
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 20,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed:  () => Get.toNamed(AppRoutes.review),
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

class PaymentCard extends StatefulWidget {
  final String title, image;
  final Payment value;

  const PaymentCard({
    super.key,
    required this.image,
    required this.title,
    required this.value,
  });

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  BookingController paymentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        // tileColor: whiteColor,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            widget.image,
            height: 25,
            width: 25,
          ),
        ),
        title: Text(
          widget.title,
          style: smallHeaderStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        trailing: Obx(
          () => Radio<Payment>(
            value: widget.value,
            groupValue: paymentController.selectedPayment.value,
            onChanged: (Payment? value) {
              paymentController.selectPayment(value);
            },
          ),
        ),
      ),
    );
  }
}

List paymentOptions = [
  {
    "image": "assets/images/mtn.jpg",
    "title": "MTN",
    "value": Payment.mtn,
  },
  {
    "image": "assets/images/orange.png",
    "title": "ORANGE",
    "value": Payment.orange,
  },
  {
    "image": "assets/images/paypal.png",
    "title": "PayPal",
    "value": Payment.paypal,
  },
  {
    "image": "assets/images/google.png",
    "title": "Google Pay",
    "value": Payment.googlePay,
  },
  {
    "image": "assets/images/apple.png",
    "title": "Apple Pay",
    "value": Payment.applePay,
  },
];
