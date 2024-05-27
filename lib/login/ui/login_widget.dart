import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_log/api/firebase/auth/auth_client.dart';
import 'package:plant_log/shared/theme/theme_colors.dart';
import 'package:plant_log/shared/ui/loading_indicator.dart';
import 'package:plant_log/sign_up/ui/sign_up_screen.dart';

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

  User? get currentUser => authClient.currentUser();

  @override
  Widget build(BuildContext context) {
    return (currentUser != null) ? logoutWidget() : signInWidget(context);
  }

  Container logoutWidget() => Container(
        decoration: BoxDecoration(
            color: ThemeColors.secondaryBackground,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 4),
              ),
            ]),
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).height * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () => widget.closeButtonCallback(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    'Name: ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentUser?.displayName ?? 'Unknown',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: currentUser?.photoURL ?? '',
                    height: 75,
                    width: 75,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentUser?.email ?? 'Unknown',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    'Phone: ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentUser?.phoneNumber ?? 'Unknown',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: ThemeColors.secondaryButton,
                    elevation: 3,
                  ),
                  onPressed: () => logout(),
                  child: const Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      );

  Container signInWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeColors.secondaryBackground,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ]),
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
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => widget.closeButtonCallback(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: emailTextController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    counterText: '',
                  ),
                  maxLength: 50,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: passwordTextController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    counterText: '',
                  ),
                  obscureText: true,
                  maxLength: 50,
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: ThemeColors.secondaryButton,
                        elevation: 3,
                      ),
                      onPressed: () => signIn(),
                      child: const Text("Login"),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () => navigateToSignUp(context),
                    child: const Text(
                      'Create Account ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (loading) const LoadingIndicator(),
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

  Future<void> logout() async {
    setState(() => loading = true);
    await authClient.signOut();
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
        signUpSuccessCallback: () =>  signUpSuccessCallback(context),
      ),
      isScrollControlled: true,
    );
  }

  void signUpSuccessCallback(BuildContext context) {
    Navigator.pop(context);
    setState(() {});
  }
}
