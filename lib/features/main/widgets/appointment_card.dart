import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/features/main/widgets/schedule_card.dart';

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF146d7c),
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/doctor01.jpeg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dr.Muhammed Syahid',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Dental Specialist',
                            style: TextStyle(color: Color(MyColors.text01)),
                          ),
                        ],
                      ),
                    ],
                  ),
                 
                  SizedBox(
                    height: 20,
                  ),
                  ScheduleCard(),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 20),
        //   width: double.infinity,
        //   height: 10,
        //   decoration: BoxDecoration(
        //     color: Color(0xFF5b99a3),
        //     borderRadius: BorderRadius.only(
        //       bottomRight: Radius.circular(10),
        //       bottomLeft: Radius.circular(10),
        //     ),
        //   ),
        // ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 40),
        //   width: double.infinity,
        //   height: 10,
        //   decoration: BoxDecoration(
        //     color: Color(0xFFa1c5cb),
        //     borderRadius: BorderRadius.only(
        //       bottomRight: Radius.circular(10),
        //       bottomLeft: Radius.circular(10),
        //     ),
        //   ),
        // ),
      
      ],
    );
  }
}
