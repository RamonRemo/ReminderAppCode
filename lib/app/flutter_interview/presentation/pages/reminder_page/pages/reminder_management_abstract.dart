import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/domain/models/entities/reminder.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_button.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_color_list.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_text_editing_controller.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_text_field.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/utils/utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class ReminderManagement extends StatefulWidget {
  final String formattedDate;
  final Function(Reminder dto, bool active) onSaved;
  final Function(bool active) onCancel;
  final Reminder? dto;
  final Function(bool active)? onDelete;

  const ReminderManagement({
    super.key,
    required this.formattedDate,
    required this.onSaved,
    required this.onCancel,
    this.dto,
    this.onDelete,
  });

  @override
  State<ReminderManagement> createState() => ReminderManagementState();
}

class ReminderManagementState extends State<ReminderManagement> {
  final CustomTextEditingController titleController =
      CustomTextEditingController();

  final CustomTextEditingController descriptionController =
      CustomTextEditingController();

  final CustomTextEditingController dateController =
      CustomTextEditingController();

  final CustomTextEditingController timeController =
      CustomTextEditingController();

  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title(),
          _titleTextField(),
          _descriptionTextField(),
          _dateAndTimeTextField(),
          _colorList(),
          const Divider(),
          buttons()
        ],
      ),
    );
  }

  title() {
    return Text(
      'Add Reminder - ${widget.formattedDate}',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }

  _titleTextField() {
    return CustomTextField(
      title: 'Title',
      hintText: 'Title',
      maxlenght: 30,
      controller: titleController,
    );
  }

  _descriptionTextField() {
    return CustomTextField(
      title: 'Description',
      hintText: 'Description',
      maxlenght: 117,
      controller: descriptionController,
    );
  }

  _dateAndTimeTextField() {
    return Row(
      children: [
        _dateTextField(),
        const SizedBox(width: 40),
        _timeTextField(),
      ],
    );
  }

  _dateTextField() {
    dateController.setText = Utils.convertDateFormat(widget.formattedDate);
    return Expanded(
      child: CustomTextField(
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '##/##/####',
          ),
        ],
        title: 'Date',
        hintText: 'MM/DD/YYYY',
        controller: dateController,
      ),
    );
  }

  _timeTextField() {
    return Expanded(
      child: CustomTextField(
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '##:##',
          ),
        ],
        title: 'Time',
        hintText: 'HH:MM',
        controller: timeController,
      ),
    );
  }

  _colorList() {
    return CustomColorList(
      selectedColor: selectedColor!,
      onTap: (Color color) {
        setState(() {
          selectedColor = color;
        });
      },
    );
  }

  buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        cancelButton(),
        const SizedBox(width: 14),
        saveButton(),
      ],
    );
  }

  CustomButton cancelButton() {
    return CustomButton(
      text: 'Cancel',
      color: const Color(0xff626262),
      onPressed: () {
        widget.onCancel(false);
      },
    );
  }

  CustomButton saveButton() {
    return CustomButton(
      text: 'Save',
      color: const Color(0xff394ABC),
      onPressed: () {
        if (!validateForm()) {
          return;
        }

        var dateString = dateController.text;
        var timeString = '${timeController.text}:00';
        DateTime? dateTime;

        try {
          dateTime = Utils.buildDateTimeObject('$dateString $timeString');
        } catch (e) {
          setState(() {
            timeController.errorText = 'invalid hour please use (HH:MM)';
            dateController.errorText = 'invalid date please use (MM/DD/YYYY)';
          });
          return;
        }

        var dto = Reminder(
          titleController.text,
          descriptionController.text,
          dateTime,
          selectedColor!,
        );

        widget.onSaved(dto, false);
      },
    );
  }

  bool validateForm() {
    String cantBeEmpty = 'Cant be empty';
    bool isValid = true;

    clearErrors();

    if (titleController.text == '') {
      setState(() {
        titleController.errorText = cantBeEmpty;
        isValid = false;
      });
    }

    if (descriptionController.text == '') {
      setState(() {
        descriptionController.errorText = cantBeEmpty;
        isValid = false;
      });
    }

    return isValid;
  }

  clearErrors() {
    titleController.errorText = null;
    descriptionController.errorText = null;
    dateController.errorText = null;
    timeController.errorText = null;
  }
}
