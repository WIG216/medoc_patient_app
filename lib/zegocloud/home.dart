import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            position: PopupMenuPosition.under,
            icon: Icon(CupertinoIcons.add_circled),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "New Chat",
                  child: ListTile(
                    leading: Icon(CupertinoIcons.chat_bubble_2_fill),
                    title: Text(
                      "New Chat",
                      maxLines: 1,
                    ),
                  ),
                  onTap: () => ZIMKit().showDefaultNewPeerChatDialog(context),
                ),
                PopupMenuItem(
                  value: "New Group",
                  child: ListTile(
                    leading: Icon(CupertinoIcons.person_2_fill),
                    title: Text(
                      "New Chat Group",
                      maxLines: 1,
                    ),
                  ),
                  onTap: () => ZIMKit().showDefaultNewGroupChatDialog(context),
                ),
                PopupMenuItem(
                  value: "Join Group",
                  child: ListTile(
                    leading: Icon(Icons.group_add),
                    title: Text(
                      "Join Group",
                      maxLines: 1,
                    ),
                  ),
                  onTap: () => ZIMKit().showDefaultJoinGroupDialog(context),
                ),
              ];
            },
          )
        ],
      ),
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ZIMKitMessageListPage(
                conversationID: conversation.id,
                conversationType: conversation.type,
              );
            }),
          );
        },
      ),
    );
  }
}
