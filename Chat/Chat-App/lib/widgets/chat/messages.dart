// @dart=2.9
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/chat/message_bubble.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {
  const Messages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdTime',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, AsyncSnapshot chatSnapshot) {
        final chatDocs = chatSnapshot.data?.docs ?? 0;

        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, idx) {
            return MessageBubble(
              chatDocs[idx].data()['text'],
              chatDocs[idx].data()['username'],
              chatDocs[idx].data()['userImage'],
              chatDocs[idx].data()['userID'] == user?.uid,
            );
          },
          itemCount: chatDocs.length,
        );
      },
    );
  }
}
