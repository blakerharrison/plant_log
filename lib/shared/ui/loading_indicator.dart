import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool showBackground;
  final bool enableDark;

  const LoadingIndicator({
    super.key,
    this.showBackground = true,
    this.enableDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: showBackground
                ? const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )
                : null,
            height: 65,
            width: 65,
          ),
        ),
        Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: enableDark ? Colors.green : Colors.lightGreenAccent,
          ),
        ),
      ],
    );
  }
}
