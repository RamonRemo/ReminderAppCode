import 'package:flutter/material.dart';

class CustomTextEditingController {
  final TextEditingController controller = TextEditingController();
  String? errorText;

  String get text => controller.text;
  set setText(value) => controller.text = value;
}
