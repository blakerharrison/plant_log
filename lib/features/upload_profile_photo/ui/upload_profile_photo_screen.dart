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
  final _defaultAvatarAssetPath = 'assets/images/cactus_avatar.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Photo 📷'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: askForPhotoAccess,
                child: const Text('Access Photos'),
              ),
              CircleAvatar(
                backgroundImage: Image.asset(_defaultAvatarAssetPath).image,
                radius: MediaQuery.sizeOf(context).width / 3.5,
              ),
            ],
          ),
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
      // NOTE: Paths is an array for albums with it's name and id attached to it
      final List<AssetPathEntity> paths =
          await PhotoManager.getAssetPathList(type: RequestType.image);
      final List<AssetEntity> entities =
          await paths[0].getAssetListPaged(page: 0, size: 80);
      final AssetEntity? asset = await AssetEntity.fromId(entities[0].id);
      final file = await asset!.file;
      // File is used to get the path of the image that can be displayed like so.
      // File is of type String
      /*
         Image.file(
          File(file),
          fit: BoxFit.cover,
        ),
       */
      log("$file");
      // final List<AssetEntity> entities = await path.getAssetListPaged(page: 0, size: 80);
    } else if (ps.hasAccess) {
      // Access will continue, but the amount visible depends on the user's selection.
      final List<AssetPathEntity> paths =
          await PhotoManager.getAssetPathList(type: RequestType.image);
      log("$paths");
    } else {
      // Limited(iOS) or Rejected, use `==` for more precise judgements.
      // You can call `PhotoManager.openSetting()` to open settings for further steps.
    }
  }
}
