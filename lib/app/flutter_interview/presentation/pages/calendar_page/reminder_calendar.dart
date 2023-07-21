// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ReminderCalendar extends StatelessWidget {
  final String year;
  final String month;
  final Function(DateTime) onChanged;

  const ReminderCalendar({
    Key? key,
    required this.year,
    required this.month,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildDecoration(),
      padding: const EdgeInsets.all(55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _title(),
          _buildCalendar(context),
        ],
      ),
    );
  }

  _title() {
    return Column(
      children: [
        Text(
          year,
          style: const TextStyle(
            fontSize: 80,
            color: Colors.white,
            height: 0.8,
          ),
        ),
        Text(
          month,
          style: const TextStyle(
            fontSize: 45,
            color: Colors.white,
            height: 0.8,
          ),
        )
      ],
    );
  }

  Widget _buildCalendar(context) {
    //not sure how to get rid of the opacity of the color
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Colors.pinkAccent,
          onSurface: Colors.white,
        ),
      ),
      child: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2022, 1, 1),
        lastDate: DateTime(2050, 12, 30),
        onDateChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }


  BoxDecoration _buildDecoration() {
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff101277),
          Color(0xff421F91),
        ],
      ),
    );
  }
}
