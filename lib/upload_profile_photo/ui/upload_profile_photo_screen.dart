import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';

class UploadProfilePhotoScreen extends StatefulWidget {
  UploadProfilePhotoScreen({super.key}) {
    updateUserProfileImage();
  }

  void updateUserProfileImage() async {
    // TODO: Abstract storage out so it's only used in 1 place
    final storage = FirebaseStorage.instance;
    final storageRef = storage.ref();
    // TODO: Replace with dynamic image URL.
    final pathReference = storageRef.child("cat.png");
    final String downloadURL = await pathReference.getDownloadURL();
    if (downloadURL.isEmpty && authClient.currentUser() == null) {
      return;
    }
    log('📷 Image URL: $downloadURL');
    authClient.currentUser()!.updatePhotoURL(downloadURL);
  }

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
