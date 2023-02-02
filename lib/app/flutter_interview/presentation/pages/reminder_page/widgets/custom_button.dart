import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
          vertical: 13,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
