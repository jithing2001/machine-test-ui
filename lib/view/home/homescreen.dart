import 'package:flutter/material.dart';
import 'package:machine/constants/appcolors.dart';
import 'package:machine/view/home/widgets/daily_task_tile.dart';
import 'package:machine/view/home/widgets/grid_widget.dart';
import 'package:machine/view/widgets/core_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var items = [
    'All Task',
  ];

  String dropdownvalue = 'All Task';

  List dailyTaskListTitle = [
    'App Animation',
    'Dashboard Design',
    'UI/UX Design'
  ];

  List linearIndicatorColors = [
    AppColors.onGoingColor,
    AppColors.completedColor,
    AppColors.inProgressColor
  ];

  List linearvalues = [0.7, 1.0, 0.3];

  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height;
    var kWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: CoreWidgets.appBarWidget(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: kHeight * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: kHeight * 0.02),
                    const Text(
                      'Hello',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: kHeight * 0.02),
                    const Text(
                      'Alex Marcony',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: kHeight * 0.02),
                    SizedBox(
                        height: kHeight * 0.28,
                        child: GridviewWidget(kHeight: kHeight)),
                    Row(
                      children: [
                        const Text(
                          'Daily task',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        DropdownButton(
                          value: dropdownvalue,

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            );
                          }).toList(),

                          onChanged: (String? newValue) {
                            dropdownvalue = newValue!;
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: kHeight * 0.02,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return DailyTaskTile(
                            kHeight: kHeight,
                            kWidth: kWidth,
                            title: dailyTaskListTitle[index],
                            linearColor: linearIndicatorColors[index],
                            index: index,
                            linearValue: linearvalues[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
