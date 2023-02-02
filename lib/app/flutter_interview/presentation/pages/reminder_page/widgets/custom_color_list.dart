import 'package:flutter/material.dart';
import 'package:flutter_interview_project_ramon/app/flutter_interview/presentation/pages/reminder_page/widgets/custom_color_rect.dart';

// ignore: must_be_immutable
class CustomColorList extends StatefulWidget {
  Color selectedColor;
  final Function(Color color) onTap;

  CustomColorList({
    Key? key,
    required this.selectedColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomColorList> createState() => _CustomColorListState();
}

class _CustomColorListState extends State<CustomColorList> {
  final List<Color> colorList = const [
    Color(0xffC8E6C9),
    Color(0xffF5DD29),
    Color(0xffFFCC80),
    Color(0xffEF9A9A),
    Color(0xffCD8DE5),
    Color(0xff5BA4CF),
    Color(0xff29CCE5),
    Color(0xff6DECA9),
    Color(0xffFF8ED4),
    Color(0xffBCAAA4),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> list = colorList
        .map((e) => CustomColorRect(
              color: e,
              onTap: (color) {
                widget.onTap(color);
              },
              isSelected: widget.selectedColor == e,
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: list,
        ),
      ],
    );
  }
}
