import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/pages/reminder_add.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/pages/reminder_edit.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_button.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_tile.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/reminder_controller.dart';

class ReminderListScreen extends StatefulWidget {
  final ReminderController controller;

  const ReminderListScreen({
    super.key,
    required this.controller,
  });

  @override
  State<ReminderListScreen> createState() => _ReminderListScreenState();
}

class _ReminderListScreenState extends State<ReminderListScreen> {
  late final controller = widget.controller;
  late final reminderList = widget.controller.filteredRemindersList;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (controller.isAdding) {
      return _goToReminderAddScreen();
    }

    if (controller.isEditing) {
      return _goToReminderEditScreen();
    }

    return Column(
      children: [
        _header(context),
        _body(context),
      ],
    );
  }

  _header(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38.0, right: 38, left: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _button(context),
        ],
      ),
    );
  }

  _body(context) {
    if (widget.controller.filteredRemindersList.isEmpty) {
      return Expanded(
        child: Image.asset(
          'assets/no-reminders.png',
          height: 297,
          width: 423,
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 38),
        child: RawScrollbar(
          thumbVisibility: true,
          interactive: true,
          thumbColor: Theme.of(context).primaryColor,
          radius: const Radius.circular(100),
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            itemCount: widget.controller.filteredRemindersList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = widget.controller.filteredRemindersList[index];
              double paddingTop = index == 0 ? 50 : 0;
              double paddingBottom =
                  index == widget.controller.filteredRemindersList.length - 1
                      ? 38
                      : 26;

              return Padding(
                padding: EdgeInsets.only(
                    top: paddingTop,
                    bottom: paddingBottom,
                    right: 17,
                    left: 38),
                child: CustomListTile(
                  reminder: item,
                  onTap: (reminder) {
                    setState(() {
                      controller.selectedTile = reminder;
                      controller.isEditing = true;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _title() {
    return Text(
      widget.controller.getFormattedTime,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }

  _button(context) {
    return CustomButton(
      text: 'Add Reminder',
      color: Colors.pinkAccent,
      onPressed: () {
        setState(() {
          controller.isAdding = true;
        });
      },
    );
  }

  _goToReminderAddScreen() {
    return ReminderAdd(
      formattedDate: widget.controller.getFormattedTime,
      onSaved: (dto, value) {
        setState(() {
          controller.onSaved(dto, value);
        });
      },
      onCancel: (value) {
        setState(() {
          controller.onCancel(value);
        });
      },
    );
  }

  Widget _goToReminderEditScreen() {
    return ReminderEdit(
      formattedDate: widget.controller.getFormattedTime,
      onSaved: (dto, value) {
        setState(() {
          controller.onEditing(dto, value);
        });
      },
      onCancel: (value) {
        setState(() {
          controller.onCancel(value);
        });
      },
      onDelete: (value) {
        setState(() {
          controller.onDelete(value);
        });
      },
      dto: controller.selectedTile!,
    );
  }
}
