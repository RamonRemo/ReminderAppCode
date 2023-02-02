import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/pages/reminder_list_screen.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/reminder_controller.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/calendar_page/reminder_calendar.dart';

class ReminderWidget extends StatefulWidget {
  const ReminderWidget({super.key});

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  final _controller = ReminderController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _reminderScreen(),
        _reminderCalendar(),
      ],
    );
  }

  Expanded _reminderCalendar() {
    return Expanded(
      flex: 450,
      child: ReminderCalendar(
        year: '${_controller.dateTime.year}',
        month: '${_controller.getMonth}',
        onChanged: (value) {
          setState(() {
            _controller.filterList(value);
            _controller.dateTime = value;
          });
        },
      ),
    );
  }

  _reminderScreen() {
    return Expanded(
      flex: 669,
      child: ReminderListScreen(
        controller: _controller,
      ),
    );
  }
}
