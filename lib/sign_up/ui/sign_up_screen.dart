import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:plant_log/shared/theme/theme_colors.dart';

//TODO: Write form validation
class SignUpScreen extends StatefulWidget {
  final Function signUpSuccessCallback;

  const SignUpScreen({super.key, required this.signUpSuccessCallback});

  @override
  State<StatefulWidget> createState() => SignUpState();
}

class SignUpState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  bool loading = false;
  bool didValidateForTheFirstTime = false;

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name'),
                    TextFormField(
                      controller: nameTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email'),
                    TextFormField(
                      controller: emailTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password'),
                    TextFormField(
                      controller: passwordTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Confirm password'),
                    TextFormField(
                      controller: confirmPasswordTextController,
                      validator: (value) {
                        if (value == passwordTextController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
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
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void validateForm() {}

  Future<void> signUp(Function successCallback) async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      didValidateForTheFirstTime = true;
      return;
    }
    setState(() => loading = true);
    try {
      await authClient.signUp(
        email: emailTextController.text,
        password: passwordTextController.text,
        displayName: nameTextController.text,
      );
      successCallback();
    } catch (e) {
      log('❌ Error has occurred, please handle.');
    }
    setState(() => loading = false);
  }
}
