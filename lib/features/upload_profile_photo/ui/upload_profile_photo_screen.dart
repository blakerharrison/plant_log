import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadProfilePhotoScreen extends StatefulWidget {
  const UploadProfilePhotoScreen({super.key});

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextButton(
              onPressed: askForPhotoAccess,
              child: const Text('Access Photos'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> askForPhotoAccess() async {
    final PermissionState ps = await PhotoManager
        .requestPermissionExtend(); // the method can use optional param `permission`.
    if (ps.isAuth) {
      // Granted
      // You can to get assets here.
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
    } else if (ps.hasAccess) {
      // Access will continue, but the amount visible depends on the user's selection.
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
    } else {
      // Limited(iOS) or Rejected, use `==` for more precise judgements.
      // You can call `PhotoManager.openSetting()` to open settings for further steps.
    }
  }
}
