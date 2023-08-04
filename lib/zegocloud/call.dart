import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:medoc_patient_app/config/zegocloud.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:permission_handler/permission_handler.dart';

// generate a random userId
final String localUserId = math.Random().nextInt(10000).toString();

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  final callIdTextCtrl = TextEditingController();

  void requestMicrophoneAndCameraPermissions() async {
    Map<Permission, PermissionStatus> permissions = await [
      Permission.microphone,
      Permission.camera,
    ].request();

    // Handle the permission statuses
    if (permissions[Permission.microphone] == PermissionStatus.granted &&
        permissions[Permission.camera] == PermissionStatus.granted) {
      // Permissions granted, proceed with your logic
    } else {
      // Permissions not granted, handle accordingly
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    requestMicrophoneAndCameraPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: callIdTextCtrl,
                  decoration: InputDecoration(labelText: "Join a call By Id"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CallPage(
                        CallId: callIdTextCtrl.text,
                      );
                    }),
                  );
                },
                child: Text("Join Call"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String CallId;
  const CallPage({
    super.key,
    required this.CallId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Utils.id,
        appSign: Utils.SignIn,
        userID: localUserId,
        userName: "iser_$localUserId",
        callID: CallId,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) {
            Navigator.of(context).pop();
          },
      ),
    );
  }
}
