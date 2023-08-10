import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/home/home_screen.dart';

void main() {
  runApp(const PlantLogApp());
}

class PlantLogApp extends StatelessWidget {
  const PlantLogApp({super.key});
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
