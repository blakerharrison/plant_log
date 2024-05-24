import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: 65,
            width: 65,
          ),
        ),
        const Center(
          child: CircularProgressIndicator(
            color: Colors.lightGreenAccent,
          ),
        ),
      ],
    );
  }
}