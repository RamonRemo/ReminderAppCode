import 'package:flutter/material.dart';

class Reminder {
  final String title;
  final String description;
  final DateTime dateTime;
  final Color color;

  Reminder(
    this.title,
    this.description,
    this.dateTime,
    this.color,
  );

  @override
  String toString() {
    return 'Reminder(Title: $title, Description: $description, DateTime: $dateTime, Color: $color)';
  }
}
