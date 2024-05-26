import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Create Account 🪷',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Create Account',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Future<void> signUp() async {
    authClient.signUp(email: '', password: '');
  }
}
