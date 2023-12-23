import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:machine/constants/appcolors.dart';
import 'package:machine/view/dashboard/dashboard.dart';
import 'package:machine/view/widgets/user_stack_widget.dart';

class DailyTaskTile extends StatelessWidget {
  const DailyTaskTile(
      {super.key,
      required this.kHeight,
      required this.kWidth,
      required this.title,
      required this.linearColor,
      required this.linearValue,
      required this.index});

  final double kHeight;
  final double kWidth;
  final String title;
  final linearColor;
  final int index;
  final double linearValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (index == 1) {
              Get.to(DashBoard());
            } else {
              Fluttertoast.showToast(msg: 'Please Select DashBoard Design');
            }
          },
          child: Container(
            height: kHeight * 0.1,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: kWidth * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == 1
                        ? const Icon(
                            Icons.check_circle,
                            color: AppColors.completedColor,
                          )
                        // ignore: prefer_const_constructors
                        : Icon(
                            Icons.check_circle_outlined,
                            color: Colors.black,
                          )
                  ],
                ),
                SizedBox(
                  width: kWidth * 0.1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: kHeight * 0.01,
                    ),
                    SizedBox(
                      height: 8,
                      width: kWidth * 0.38,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          value: linearValue,
                          valueColor: AlwaysStoppedAnimation(linearColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                UserStackWidget(
                  kWidth: kWidth,
                  isExtraUser: false,
                ),
                const Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
          ),
        ),
        SizedBox(
          height: kHeight * 0.01,
        )
      ],
    );
  }
}
