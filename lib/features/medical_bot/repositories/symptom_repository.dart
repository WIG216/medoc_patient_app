import 'dart:convert';

import 'package:medoc_patient_app/models/disease_info.dart';
import 'package:http/http.dart' as http;

class SymptomsRepository {
    Future<DiseaseInfo?> fetchDiseaseInfo(List<String> symptoms) async {
    final url = Uri.parse(
        'https://7656-2a0d-5600-44-8000-00-53a9.ngrok-free.app/symptom'); // Replace with the actual API endpoint URL

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'symptoms': symptoms}),
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        final Map<String, dynamic> data = json.decode(jsonData);
        final diseaseInfo = DiseaseInfo.fromJson(data);
        return diseaseInfo;
      } else {
        print(
            'Failed to fetch disease information. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error while fetching disease information: $e');
      return null;
    }
  }

}