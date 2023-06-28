import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/features/pharmacy/controllers/search_controller.dart';

class PickupDrugSearch extends GetView<SearchingController> {
  PickupDrugSearch({super.key});
  var searchText = "".obs;
  SearchingController searchingController = Get.put(SearchingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Container(
        height: 160.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 2,
              offset: Offset(0, 1), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.pin_drop),
            ),
            title: Text("Pickup"),
            subtitle: Text(
              "Current Location",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            child: Divider(
              color: Colors.grey.withOpacity(0.3),
            ),
            width: 390,
            height: 0,
          ),
          ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.medical_information),
              ),
              title: Text("Search drug"),
              subtitle: TextField(
                autocorrect: false,
                onSubmitted: (value) {
                  searchingController.search(value);
                },
                autofocus: true,
                cursorHeight: 15.0,
                onChanged: (value) {
                  searchText.value = value;
                },
                decoration: const InputDecoration(
                    hintText: "paracitamol", border: InputBorder.none),
              )),
        ]),
      ),
    );
  }
}
