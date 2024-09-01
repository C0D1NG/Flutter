import 'dart:io';

import 'package:flutter/material.dart';

import 'package:starter/widgets/buttons/primary_filled_button.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.updateText,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String content;
  final String updateText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => exit(0),
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        actionsPadding: const EdgeInsets.all(16.0),
        title: Text(title),
        content: Text(content),
        actions: [PrimaryFilledButton(text: updateText, onTap: onTap)],
      ),
    );
  }
}
