import 'package:flutter/material.dart';
import 'package:machine/view/widgets/user_stack_widget.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    super.key,
    required this.kWidth,
  });

  final double kWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Team',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        UserStackWidget(kWidth: kWidth, isExtraUser: true),
      ],
    );
  }
}
