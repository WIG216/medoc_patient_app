import 'package:agora_rtm/agora_rtm.dart';
import 'package:flutter/material.dart';
import 'package:medoc_patient_app/chat.dart';
import 'package:medoc_patient_app/config/agora.dart';
import 'package:medoc_patient_app/logs.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _user_id = TextEditingController();
  final _channelName = TextEditingController();
  late AgoraRtmClient _client;
  late AgoraRtmChannel _channel;
  LogController logController = LogController();

  @override
  void initState() {
    super.initState();
    _createClient();
  }

  void _createClient() async {
    _client = await AgoraRtmClient.createInstance(appId);
    _client.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      logController
          .addLog("Private Message from" + peerId + ": " + message.text);
    };
    _client.onConnectionStateChanged = (int state, int reason) {
      logController.addLog('Conntection state changed: ' +
          state.toString() +
          ", reason: " +
          reason.toString());
      if (state == 5) {
        _client.logout();
        logController.addLog("Logout");
      }
    };
  }

  void _login(BuildContext context) async {
    String userId = _user_id.text;
    if (userId.isEmpty) {
      print("Please input your user id to login");
      return;
    }
    try {
      await _client.login(null, userId);
      logController.addLog("Login Success" + userId);
      // _joinChannerl(context);
    } catch (errorCode) {
      print("Loign error: " + errorCode.toString());
    }
  }

  // void _joinChannerl(BuildContext context) async {
  //   String channelId = _channelName.text;
  //   if (channelId.isEmpty) {
  //     print("Please input your channel id to login");
  //     return;
  //   }
  //   try {
  //     _channel = await _createChannel(channelId);
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(logController: logController)));
  //   } catch (errorCode) {
  //     print("Join Channel error: " + errorCode.toString());
  //   }
  // }
// Future<AgoraRtmChannel> _createChannel(String name) async{
//   AgoraRtmChannel channel = await _client.createChannel(name);
//   channel.onMemberJoined = (AgoraRtmMember member){
//     logController.addLog("Member joined: ");

//   };
//   channel.onMemberLeft = (AgoraRtmMember member){
//     logController.addLog("Member left: ");

//   };
//   channel.onMessageReceived = (AgoraRtmMessage message, AgoraRtmMember member){
//     logController.addLog("Member joined: ");

//   };
//   return channel;
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Real Time Message'),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _user_id,
                decoration: InputDecoration(hintText: "User ID"),
              ),
              TextField(
                controller: _channelName,
                decoration: InputDecoration(hintText: "Channel"),
              ),
              OutlinedButton(
                  onPressed: () => _login(context), child: Text('Login'),
              )
            ],
          )),
    );
  }
}
