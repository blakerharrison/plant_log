import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:plant_log/shared/theme/theme_colors.dart';
import 'package:plant_log/shared/ui/loading_indicator.dart';
import 'package:plant_log/sign_up/ui/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  final Function loginSuccessCallback;

  const LoginScreen({super.key, required this.loginSuccessCallback});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AbsorbPointer(
          absorbing: loading,
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
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
                              'Sign In',
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
                          onPressed: () => signIn(
                            context,
                            successCallback: widget.loginSuccessCallback,
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () => navigateToSignUp(context),
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
      return 'Please enter a $formFileName';
    }
    return null;
  }

  Future<void> signIn(BuildContext context,
      {required Function successCallback}) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => loading = true);
    try {
      await authClient.signIn(
        emailTextController.text,
        passwordTextController.text,
        signInError,
      );
      successCallback();
    } catch (e) {
      log('❌ - Sign In Error Occurred: $e');
    }
    setState(() => loading = false);
  }

  void signInError(FirebaseSignInErrorCode code) {
    switch (code) {
      case FirebaseSignInErrorCode.userNotFound:
        log('🔥❌ - FirebaseSignInErrorCode: userNotFound');
      case FirebaseSignInErrorCode.wrongPassword:
        log('🔥❌ - FirebaseSignInErrorCode: wrongPassword');
      case FirebaseSignInErrorCode.unknown:
        log('🔥❌ - FirebaseSignInErrorCode: wrongPassword');
    }
  }

  void navigateToSignUp(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SignUpScreen(
        signUpSuccessCallback: () {
          // TODO: Push replacement to upload image screen.
        },
      ),
      isScrollControlled: true,
    );
  }
}
