import 'package:flutter/material.dart';
import 'package:medoc_patient_app/features/pharma/widgets/pharmacy_list.dart';
import 'package:medoc_patient_app/features/pharma/widgets/pharmacy_search.dart';

class SearchSheet extends StatelessWidget {
  SearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            height: 5.0,
            width: 40.0,
          ),
          PharmacySearch(),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 5,
                    offset: Offset(0, -1), // Shadow position
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              // child: PharmacyList(),
            ),
          )
        ],
      ),
    );
  }
}
