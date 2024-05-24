import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:plant_log/shared/ui/loading_indicator.dart';

class LoginWidget extends StatefulWidget {
  final Function closeButtonCallback;

   const LoginWidget({super.key, required this.closeButtonCallback});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginWidget> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.45,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      // TODO: Replace with a callback to decouple this.
                      onPressed: () => widget.closeButtonCallback(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                TextField(
                  controller: emailTextController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                TextField(
                  controller: passwordTextController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  obscureText: true,
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        elevation: 3,
                      ),
                      onPressed: () => signIn(),
                      child: const Text("Login"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (loading)
            const LoadingIndicator(),
        ],
      ),
    );
  }

  void signIn() async {
    setState(() => loading = true);
    await authClient.signIn(
      emailTextController.text,
      passwordTextController.text,
      signInError,
    );
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
}