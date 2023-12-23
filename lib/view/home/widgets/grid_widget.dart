import 'package:flutter/material.dart';
import 'package:machine/constants/appcolors.dart';

class GridviewWidget extends StatelessWidget {
  GridviewWidget({
    super.key,
    required this.kHeight,
  });

  final double kHeight;
  List iconList = [
    Icons.access_time,
    Icons.repeat,
    Icons.task,
    Icons.event_busy
  ];

  List titleList = ['In Progress', 'Ongoing', 'Completed', 'Cancel'];
  List colorList = [
    AppColors.inProgressColor,
    AppColors.onGoingColor,
    AppColors.completedColor,
    AppColors.cancelColor
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.60,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Card(
          color: colorList[index],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index],
                color: Colors.white,
              ),
              SizedBox(height: kHeight * 0.01),
              Text(
                titleList[index],
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        );
      },
    );
  }
}
