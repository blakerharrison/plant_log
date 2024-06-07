import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_log/features/home/ui/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool enableFirebaseAuthEmulator =
      const bool.fromEnvironment('ENABLE_FIREBASE_AUTH_EMULATOR');
  if (enableFirebaseAuthEmulator == true) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
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
        // home: HomeScreen(),
        home: HomeScreen(),
      ),
    );
  }
}
