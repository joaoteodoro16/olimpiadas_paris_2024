import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;

  const ButtonApp({super.key, required this.text, this.onPressed})
      : height = 40,
        width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
