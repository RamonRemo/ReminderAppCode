import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/reminder_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 235, 243, 254),
        child: Center(
          child: SizedBox(
            height: 686,
            width: 1119,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: const ReminderWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
