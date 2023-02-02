// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/pages/reminder_management_abstract.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_button.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/utils/utils.dart';

class ReminderEdit extends ReminderManagement {
  const ReminderEdit({
    super.key,
    required super.onDelete,
    required super.formattedDate,
    required super.onSaved,
    required super.onCancel,
    required super.dto,
  });

  @override
  ReminderEditState createState() => ReminderEditState();
}

class ReminderEditState extends ReminderManagementState {
  @override
  void initState() {
    titleController.setText = widget.dto!.title;
    descriptionController.setText = widget.dto!.description;
    dateController.setText = Utils.convertDateFormat(widget.formattedDate);
    timeController.setText =
        Utils.getFormattedHourFromDateTime(widget.dto!.dateTime);
    selectedColor = widget.dto!.color;
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
      'Edit Reminder - ${widget.formattedDate}',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }

  @override
  buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
            onPressed: () {
              widget.onDelete!(false);
            },
            text: 'Remove',
            color: const Color(0xffD42222)),
        super.buttons()
      ],
    );
  }
}
