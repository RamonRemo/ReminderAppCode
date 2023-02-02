// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_text_editing_controller.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final int? maxlenght;
  final CustomTextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.inputFormatters,
    this.maxlenght,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        TextFormField(
          controller: controller.controller,
          maxLength: maxlenght,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            counterText: '',
            errorText: controller.errorText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x6631272566),
                width: 1,
              ),
            ),
            hoverColor: const Color(0xff101277),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
