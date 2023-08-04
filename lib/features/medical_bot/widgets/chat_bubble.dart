import 'package:flutter/material.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.fromLTRB(isMe ? 60 : 10, 4, isMe ? 10 : 60, 4),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? primaryColor : Color(0xffe2edef),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: Radius.circular(!isMe ? 0 : 15),
            bottomRight: Radius.circular(!isMe ? 15 : 0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
