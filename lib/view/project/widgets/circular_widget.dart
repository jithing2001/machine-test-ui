import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    required this.kWidth,
    required this.kHeight,
    required this.percentvalue,
    required this.percentageText,
    required this.percentColor,
  });

  final double kWidth;
  final double kHeight;
  final double percentvalue;
  final String percentageText;
  final Color percentColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: kWidth * 0.27,
      // height: kHeight * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircularPercentIndicator(
            radius: 45.0,
            lineWidth: 10.0,
            percent: percentvalue,
            center: Text(
              percentageText,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            backgroundColor: Colors.grey,
            progressColor: percentColor,
          ),
        ],
      ),
    );
  }
}
