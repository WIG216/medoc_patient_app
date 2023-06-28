import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class SearchingController extends GetxController {
  var phamacies = [].obs;
  var isDataLoading = false.obs;

  Future<List<dynamic>> seachRequest(String item) async {
isDataLoading(true);
    final response = await http.post(
      Uri.parse('http://172.20.10.4:8070/search'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'searchItem': item,
        'userLocation': {'latitude': '4.080807', 'longitude': '9.771714'},
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      phamacies.value = jsonDecode(response.body);
      isDataLoading(false);
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  search(String item) {
    seachRequest(item);
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
