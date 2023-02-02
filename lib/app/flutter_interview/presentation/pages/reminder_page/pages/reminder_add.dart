// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/pages/reminder_management_abstract.dart';

class ReminderAdd extends ReminderManagement {
  const ReminderAdd({
    super.key,
    required super.formattedDate,
    required super.onSaved,
    required super.onCancel,
  });

  @override
  ReminderAddReminderState createState() => ReminderAddReminderState();
}

class ReminderAddReminderState extends ReminderManagementState {
  @override
  void initState() {
    selectedColor = const Color(0xffC8E6C9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: super.build(context),
    );
  }

  @override
  title() {
    return Text(
      'Add Reminder - ${widget.formattedDate}',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }
}
