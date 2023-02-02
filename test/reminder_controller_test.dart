import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/domain/models/entities/reminder.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/reminder_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:intl/intl.dart';

void main() {
  late ReminderController reminderController;
  late Reminder julyReminder;
  late Reminder juneReminder;

  setUp(() {
    reminderController = ReminderController();
    juneReminder = juneReminder = Reminder(
      'Shopping',
      'Buy Shield',
      DateTime(2022, 06, 22),
      const Color(0xFF42A5F5),
    );

    julyReminder = Reminder(
      'Shopping',
      'Buy Sword',
      DateTime(2022, 07, 04),
      const Color(0xFF42A5F5),
    );
  });

  test('shouldReturnsTheCurrentMonth', () {
    final expected = DateFormat('MMMM').format(DateTime.now()).toString();

    expect(reminderController.getMonth, expected);
  });

  test('shouldReturnsTheCurrentDayOfTheWeek', () {
    final expected = DateFormat('EEEE').format(DateTime.now()).toString();

    expect(reminderController.getDay, expected);
  });

  test('shouldReturnsTheFormattedTime', () {
    final dayOfTheMonth = DateTime.now().day.toString();
    final year = DateTime.now().year.toString();
    final expected =
        '${reminderController.getDay}, ${reminderController.getMonth} $dayOfTheMonth, $year';

    expect(reminderController.getFormattedTime, expected);
  });

  test('shouldAddAReminderToTheList', () {
    reminderController.onSaved(julyReminder, false);
    final result = reminderController.remindersList;

    expect(result, [julyReminder]);
  });

  test('shouldEditReminderOnList', () {
    reminderController.onSaved(julyReminder, false);
    reminderController.selectedTile = julyReminder;
    reminderController.onEditing(juneReminder, false);
    final result = reminderController.remindersList;

    expect(result, [juneReminder]);
  });

  test('shouldDeleteReminder', () {
    reminderController.onSaved(julyReminder, false);
    reminderController.selectedTile = julyReminder;
    reminderController.onDelete(false);

    final result = reminderController.remindersList;
    expect(result, []);
  });

  test('shouldSortByDateTime', () {
    reminderController.onSaved(julyReminder, false);
    reminderController.onSaved(juneReminder, false);
    reminderController.sortList();

    final result = reminderController.remindersList;
    expect(result, [juneReminder, julyReminder]);
  });

  test('shouldfilterByDateTime', () {
    reminderController.onSaved(julyReminder, false);
    reminderController.onSaved(juneReminder, false);
    reminderController.filterList(
      DateTime(2022, 07, 04),
    );

    final result = reminderController.filteredRemindersList;
    expect(result, [julyReminder]);
  });
}
