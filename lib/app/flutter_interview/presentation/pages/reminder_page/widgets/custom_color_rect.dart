// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomColorRect extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final Function(Color color) onTap;

  const CustomColorRect({
    Key? key,
    required this.color,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(color);
      },
      child: Container(
        width: 55,
        height: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : const Color(0x6631272566),
            width: isSelected ? 2.5 : 1,
          ),
        ),
      ),
    );
  }
}
