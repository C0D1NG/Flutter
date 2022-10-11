// @dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker(this.imagePickFn, {Key key}) : super(key: key);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _storedImage;
  Future<void> _takePicture() async {
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 200,
    );
    if (imageFile == null) return;
    setState(() {
      _storedImage = File(imageFile.path);
    });
    widget.imagePickFn(_storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        radius: 45,
        backgroundColor: Colors.purple,
        backgroundImage: _storedImage != null ? FileImage(_storedImage) : null,
      ),
      TextButton.icon(
        onPressed: _takePicture,
        icon: Icon(
          Icons.image,
          color: Theme.of(context).primaryColor,
        ),
        label: Text(
          'Add Image',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      )
    ]);
  }
}
