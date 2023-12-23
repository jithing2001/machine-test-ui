import 'package:flutter/material.dart';

class TitleAndShareWidget extends StatelessWidget {
  const TitleAndShareWidget(
      {super.key,
      required this.title,
      required this.sharedBy,
      this.fontSize = 18});

  final String title;
  final String sharedBy;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('Today Shared by - $sharedBy'),
      ],
    );
  }
}
