import 'package:flutter/material.dart';
import 'package:medoc_patient_app/logs.dart';

class ChatScreen extends StatefulWidget {
  final LogController logController;
  const ChatScreen({
    super.key,
    required this.logController,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _peerUserId = TextEditingController();
  final _peerMessage = TextEditingController();
  final _channelMessage = TextEditingController();

  void _isUserOnline() async {}
  void _sendPeerMessage() async {}
  void _sendChannelMessage() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Agora Real Time Message"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _peerUserId,
                    decoration: InputDecoration(hintText: "Input peer user id"),
                  ),
                ),
                OutlinedButton(
                  onPressed: _isUserOnline,
                  child: Text("Check if User Online"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _channelMessage,
                    decoration: InputDecoration(hintText: "Input peer message"),
                  ),
                ),
                OutlinedButton(
                  onPressed: _isUserOnline,
                  child: Text("Send to peer"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _channelMessage,
                    decoration: InputDecoration(hintText: "Input peer message"),
                  ),
                ),
                OutlinedButton(
                  onPressed: _sendChannelMessage,
                  child: Text("Send to channel"),
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: widget.logController,
              builder: (context, log, widget) {
                return Expanded(
                  child: Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: log.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            title: Text(
                              log[i],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
