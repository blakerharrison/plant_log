// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:plant_log/firebase_options.dart';
import 'package:plant_log/home/ui/home_screen.dart';

void main() async {
  runApp(const PlantLogApp());
}

class PlantLogApp extends StatefulWidget {
  const PlantLogApp({super.key});

  @override
  State<PlantLogApp> createState() => _PlantLogAppState();
}

class _PlantLogAppState extends State<PlantLogApp> {
  @override
  void initState() {
    super.initState();
    // Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Plant Log',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: Home(),
      ),
    );
  }
}
