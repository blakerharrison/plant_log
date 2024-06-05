import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:plant_log/shared/theme/theme_colors.dart';
import 'package:plant_log/shared/ui/loading_indicator.dart';
import 'package:plant_log/upload_profile_photo/ui/upload_profile_photo_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: loading,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                        child: Row(
                          children: [
                            const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.close_sharp,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                            controller: nameTextController,
                            validator: (value) => _validator(
                              value,
                              formFileName: 'name',
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            controller: emailTextController,
                            validator: (value) => _validator(
                              value,
                              formFileName: 'email',
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            controller: passwordTextController,
                            obscureText: true,
                            validator: (value) => _validator(
                              value,
                              formFileName: 'password',
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(),
                            ),
                            controller: confirmPasswordTextController,
                            obscureText: true,
                            validator: (value) {
                              if (value != passwordTextController.text) {
                                return 'Passwords do not match';
                              }
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty.';
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
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: ThemeColors.secondaryButton,
                            elevation: 3,
                          ),
                          onPressed: () => signUp(
                            context,
                            successCallback: widget.signUpSuccessCallback,
                          ),
                          child: const Text('Create Account'),
                        ),
                      ),
                    ],
                  ),
                ),
                if (loading) const LoadingIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validator(value, {required String formFileName}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  Future<void> signUp(BuildContext context,
      {required Function successCallback}) async {
    if (!_formKey.currentState!.validate()) {
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
      if (!context.mounted) return;
      _navigateToUploadProfilePhotoScreen(context);
    } catch (e) {
      log('❌ Error has occurred, please handle.');
    }
    setState(() => loading = false);
  }

  void _navigateToUploadProfilePhotoScreen(BuildContext context) async {
    Route route = MaterialPageRoute(
        builder: (context) => const UploadProfilePhotoScreen());
    await Navigator.of(context).pushReplacement(route);
  }
}
