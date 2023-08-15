// import 'dart:convert';
//
// import 'package:plant_log/api/logger/logger.dart';
// import 'package:plant_log/architecture/types/entity.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Repository {
//   static Future<void> cache(Entity e) async {
//     final prefs = await SharedPreferences.getInstance();
//     final json = e.toJson();
//     final jsonEncoded = jsonEncode(json);
//     if (jsonEncoded.isEmpty) {
//       Logger.error('Failed to cache Entity: $e');
//       return;
//     }
//     prefs.setString('cache', jsonEncoded);
//   }
// }
//
