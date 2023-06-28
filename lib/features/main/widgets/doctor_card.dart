import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';

class DoctorCard extends StatelessWidget {
  final Function()? handleBook, handleMessage;
  final String doctorName, doctorTitle, imagePath;

  const DoctorCard({
    super.key,
    this.handleBook,
    this.handleMessage,
    required this.doctorName,
    required this.doctorTitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        width: 175,
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    // fit: BoxFi.t.cover,
                  )),
              // child: Image.asset("assets/images/doc-1.jpg", height: 150, width: 100,),
            ),
            8.height,
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  5.height,
                  Text(
                    doctorTitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  5.height,
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: handleBook,
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      8.width,
                      Expanded(
                        child: OutlinedButton(
                          onPressed: handleMessage,
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.only(left: 1, top: 3),
                            // backgroundColor: primaryColor.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Icon(
                            Icons.message,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 10.height,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
