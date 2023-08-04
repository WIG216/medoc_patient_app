import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/features/medical_bot/controllers/symptom_controller.dart';
import 'package:medoc_patient_app/features/medical_bot/widgets/chat_bubble.dart';
import 'package:medoc_patient_app/features/medical_bot/widgets/typing_indicator.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Medoc Bot',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final List<ChatMessage> messages =
                  chatController.messages.reversed.toList();
              final bool isLoading = chatController.isLoading.value;
              return ListView.builder(
                reverse: true,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                itemCount: messages.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  final messageIndex = isLoading ? index - 1 : index;

                  if (index == 0 && isLoading) {
                    return TypingIndicator();
                  } else if (index == messages.length && isLoading) {
                    return Container();
                  } else {
                    return ChatBubble(
                      message: messages[messageIndex].message,
                      isMe: messages[messageIndex].isMe,
                    );
                  }
                },
              );
            }),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: scaffoldBgColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextField(
                      maxLines: 3,
                      minLines: 1,
                      controller: chatController.textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    chatController.sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
