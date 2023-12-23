import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine/constants/appcolors.dart';
import 'package:machine/controller/dashboard_controller.dart';
import 'package:machine/view/dashboard/widgtes/chart.dart';
import 'package:machine/view/project/widgets/circular_widget.dart';
import 'package:machine/view/project/widgets/team_widget.dart';
import 'package:machine/view/project/widgets/title_and_share_widget.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});
  DashBoardController dashBoardController = Get.put(DashBoardController());

  List<String> text = [
    "Create userflow",
    "Create wireframe",
    "Transform to visual design"
  ];
  var items = ['Weekly', 'Monthly'];
  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height;
    var kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const TitleAndShareWidget(
                title: 'Dashboard Design',
                sharedBy: 'Unbox Digital',
                fontSize: 23,
              ),
              SizedBox(
                height: kHeight * 0.05,
              ),
              SizedBox(
                height: kHeight * 0.20,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: kWidth * 0.04,
                    ),
                    Column(
                      children: [
                        CircularIndicator(
                            kWidth: kWidth,
                            kHeight: kHeight,
                            percentvalue: 0.85,
                            percentageText: '85%',
                            percentColor: AppColors.completedColor)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TeamWidget(kWidth: kWidth),
                        SizedBox(
                          height: kHeight * 0.02,
                        ),
                        const Text(
                          'Deadline',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: kHeight * 0.01,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month),
                            SizedBox(
                              width: kWidth * 0.01,
                            ),
                            const Text('July 25,2021 - July 30,2021')
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Text(
                'Project Progress',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kHeight * 0.01,
              ),
              SizedBox(
                height: 200.0,
                child: Column(
                  children: List.generate(text.length, (index) {
                    return Obx(() {
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(text[index]),
                        value: dashBoardController.checkboxValues[index],
                        onChanged: (val) {
                          dashBoardController.checkBoxUpdate(
                              index, val ?? false);
                        },
                      );
                    });
                  }),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Project Overview',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Obx(() {
                    return DropdownButton(
                      value: dashBoardController.dropdownvalue.value,

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
                        dashBoardController.changeDropValue(newValue!);
                      },
                    );
                  })
                ],
              ),
              SizedBox(height: kHeight * 0.22, child: ChartWidget())
            ],
          ),
        ),
      ),
    );
  }
}
