import 'package:flutter/material.dart';
import 'package:machine/constants/appcolors.dart';
import 'package:machine/view/project/widgets/circular_widget.dart';
import 'package:machine/view/project/widgets/team_widget.dart';
import 'package:machine/view/project/widgets/title_and_share_widget.dart';

class SampleWidget extends StatelessWidget {
  SampleWidget({Key? key, required this.label, required this.color})
      : super(key: key);

  final String label;
  final Color color;

  List titleList = ['App Animation', 'Dashboard Design', 'UI/UX Design'];
  List sharedByList = ['Unbox Digital', 'Ui Been', 'Unbox'];
  List date = [
    'June 15,2021 - June 22,2021',
    'July 20,2021 - July 30,2021',
    'Aug 15,2021 - Aug 18,2021'
  ];
  List percentColor = [
    AppColors.onGoingColor,
    AppColors.completedColor,
    AppColors.inProgressColor
  ];
  List percentageText = ['65%', '85%', '30%'];
  List percentvalue = [0.65, 0.85, 0.3];

  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height;
    var kWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: kHeight * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TitleAndShareWidget(
                              title: titleList[index],
                              sharedBy: sharedByList[index]),
                          const SizedBox(
                            height: 20,
                          ),
                          TeamWidget(kWidth: kWidth),
                          SizedBox(
                            height: kHeight * 0.015,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(date[index])
                            ],
                          )
                        ],
                      ),
                      CircularIndicator(
                          kWidth: kWidth,
                          kHeight: kHeight,
                          percentvalue: percentvalue[index],
                          percentageText: percentageText[index],
                          percentColor: percentColor[index]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kHeight * 0.01,
              )
            ],
          );
        });
  }
}
