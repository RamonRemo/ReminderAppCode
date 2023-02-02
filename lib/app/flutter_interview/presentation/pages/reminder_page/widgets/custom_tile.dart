import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/domain/models/entities/reminder.dart';

class CustomListTile extends StatelessWidget {
  final Reminder reminder;
  final Function(Reminder? reminder) onTap;

  const CustomListTile({
    super.key,
    required this.reminder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 134,
          width: 567,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xffD1DCF0),
                // color: Colors.red,
                blurRadius: 28.0,
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 10,
              ),
              _colorTag(),
              _titleAndDescription(),
              _divider(),
              _timeWidget(),
            ],
          ),
        ),
        Positioned(
          bottom: -15,
          right: -4,
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff3BC6FB),
                  Color(0xff00FFCC),
                ],
              ),
              // color: Colors.lightBlueAccent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 19,
                ),
                onPressed: () {
                  onTap(reminder);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _colorTag() {
    return Container(
      width: 12,
      height: 111,
      decoration: BoxDecoration(
        color: reminder.color,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  _titleAndDescription() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _description(),
        ],
      ),
    );
  }

  _divider() {
    return const VerticalDivider(
      color: Color(0xffD1DCF0),
    );
  }

  _timeWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.access_time,
            size: 45,
            color: Color(0xff797979),
          ),
          Text(
            '${reminder.dateTime.hour} : ${reminder.dateTime.minute}',
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color(0xff797979)),
          ),
        ],
      ),
    );
  }

  _title() {
    return Text(
      reminder.title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xff797979),
      ),
    );
  }

  _description() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      width: 380,
      child: Text(
        reminder.description,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
