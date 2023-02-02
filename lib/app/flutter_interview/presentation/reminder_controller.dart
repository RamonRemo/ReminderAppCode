import 'package:flutter_interview_project_ramon/app/flutter_interview/domain/models/entities/reminder.dart';
import 'package:intl/intl.dart';

class ReminderController {
  DateTime dateTime = DateTime.now();
  List<Reminder> remindersList = [];
  List<Reminder> filteredRemindersList = [];
  bool isAdding = false;
  bool isEditing = false;
  Reminder? selectedTile;

  get getMonth {
    return DateFormat('MMMM').format(dateTime).toString();
  }

  get getDay {
    return DateFormat('EEEE').format(dateTime).toString();
  }

  get getFormattedTime {
    final dayOfTheMonth = dateTime.day.toString();
    final year = dateTime.year.toString();

    return '$getDay, $getMonth $dayOfTheMonth, $year';
  }

  void onSaved(Reminder dto, bool value) {
    remindersList.add(dto);
    isAdding = value;
    isEditing = value;
    sortList();
    filterList(dateTime);
  }

  void onEditing(Reminder dto, bool value) {
    remindersList.remove(selectedTile);
    remindersList.add(dto);
    isAdding = value;
    isEditing = value;
    sortList();
    filterList(dateTime);
  }

  void onDelete(bool value) {
    remindersList.remove(selectedTile);

    isAdding = value;
    isEditing = value;
    filterList(dateTime);
  }

  void onCancel(value) {
    isAdding = value;
    isEditing = value;
  }

  sortList() {
    remindersList.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  void filterList(DateTime value) {
    filteredRemindersList = remindersList
        .where((item) =>
            item.dateTime.year == value.year &&
            item.dateTime.month == value.month &&
            item.dateTime.day == value.day)
        .toList();

  }
  
}
