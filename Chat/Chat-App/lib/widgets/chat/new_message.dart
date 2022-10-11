// @dart=2.9
import 'package:flutter/material.dart';

import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMessage = '';
  final _controller = TextEditingController();

  void _sendMessage() async {
    // Focus.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdTime': Timestamp.now(),
      'userID': user?.uid,
      'username': userData.data()['username'],
      'userImage': userData.data()['image_url'],
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Type a new message',
              ),
              onChanged: (val) {
                setState(() {
                  _enteredMessage = val;
                });
              },
              controller: _controller,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
            ),
            color: Theme.of(context).primaryColor,
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
