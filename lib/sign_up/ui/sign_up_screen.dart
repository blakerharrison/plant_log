import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:plant_log/shared/theme/theme_colors.dart';

class SignUpScreen extends StatefulWidget {
  final Function signUpSuccessCallback;

  const SignUpScreen({super.key, required this.signUpSuccessCallback});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpScreen> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  bool loading = false;

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
      body: AbsorbPointer(
        absorbing: loading,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textFieldWithHeader(
                title: 'Name',
                controller: nameTextController,
              ),
              _textFieldWithHeader(
                title: 'Email',
                controller: emailTextController,
              ),
              _textFieldWithHeader(
                title: 'Password',
                controller: passwordTextController,
                obscureText: true,
              ),
              _textFieldWithHeader(
                title: 'Confirm Password',
                controller: confirmPasswordTextController,
                obscureText: true,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: ThemeColors.secondaryButton,
                    elevation: 3,
                  ),
                  onPressed: () => signUp(widget.signUpSuccessCallback),
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _textFieldWithHeader({
    required String title,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextField(
          controller: controller,
          obscureText: obscureText,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void validateForm() {}

  Future<void> signUp(Function successCallback) async {
    setState(() => loading = true);
    try {
      await authClient.signUp(
        email: emailTextController.text,
        password: passwordTextController.text,
        displayName: nameTextController.text,
      );
      successCallback();
    } catch (e) {
      log('❌ Error has occured, please handle.');
    }
    setState(() => loading = false);
  }
}
