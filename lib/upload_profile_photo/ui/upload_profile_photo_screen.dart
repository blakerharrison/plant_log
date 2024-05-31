import 'package:flutter/material.dart';

class UploadProfilePhotoScreen extends StatefulWidget {
  const UploadProfilePhotoScreen({super.key});

  @override
  State<StatefulWidget> createState() => UploadProfilePhotoScreenState();
}

class UploadProfilePhotoScreenState extends State<UploadProfilePhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Photo 📷'),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
