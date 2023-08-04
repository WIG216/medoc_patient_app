// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medoc_patient_app/features/medical_bot/controllers/symptom_controller.dart';

// class ChatScreen extends StatelessWidget {
//   final SymptomController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController messageController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 itemCount: controller.chatMessages.length,
//                 reverse: true,
//                 itemBuilder: (context, index) {
//                   final message = controller.chatMessages[index];
//                   return ChatBubble(
//                     text: message.text,
//                     isUserMessage: message.isUserMessage,
//                   );
//                 },
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     final messageText = messageController.text.trim();
//                     if (messageText.isNotEmpty) {
//                       controller.sendMessage(messageText);
//                       messageController.clear();
//                     }
//                   },
//                   icon: Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatBubble extends StatelessWidget {
//   final String text;
//   final bool isUserMessage;

//   const ChatBubble({
//     required this.text,
//     required this.isUserMessage,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final alignment = isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start;
//     final bubbleColor = isUserMessage ? Colors.blue : Colors.grey[300];
//     final textColor = isUserMessage ? Colors.white : Colors.black;

//     return Row(
//       mainAxisAlignment: alignment,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//           padding: EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             color: bubbleColor,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Text(
//             text,
//             style: TextStyle(
//               color: textColor,
//               fontSize: 16.0,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
