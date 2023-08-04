import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medoc_patient_app/features/medical_bot/repositories/symptom_repository.dart';
import 'package:medoc_patient_app/models/disease_info.dart';

class ChatController extends GetxController {
    final SymptomsRepository _symptomsRepository = SymptomsRepository();

  final List<ChatMessage> messages = <ChatMessage>[].obs;
  final TextEditingController textController = TextEditingController();
  final RxBool isLoading = false.obs;

  Future<void> sendMessage() async {

    final message = textController.text.trim();

    if (message.isNotEmpty) {
      messages.add(ChatMessage(message: message, isMe: true));
      textController.clear();

      final symptoms = [message.trim().toLowerCase()];
      isLoading.value = true;

      final diseaseInfo = await _symptomsRepository.fetchDiseaseInfo(symptoms);

      isLoading.value = false;

      if (diseaseInfo != null) {
        messages.add(ChatMessage(
          message:
              'Disease: ${diseaseInfo.disease}\nDescription: ${diseaseInfo.description}\nPrecautions: ${diseaseInfo.precautions}',
          isMe: false,
        ));
      } else {
        messages.add(ChatMessage(
            message: 'Failed to fetch disease information.', isMe: false));
      }
    }
  }


}

class ChatMessage {
  final String message;
  final bool isMe;

  ChatMessage({required this.message, required this.isMe});
}
