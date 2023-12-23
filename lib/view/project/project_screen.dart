import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:machine/constants/appcolors.dart';
import 'package:machine/view/project/widgets/container_widget.dart';
import 'package:machine/view/widgets/core_widgets.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CoreWidgets.appBarWidget(),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kHeight * 0.03,
              ),
              const Text(
                'Project',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SegmentedTabControl(
                        // Customization of widget
                        radius: const Radius.circular(20),
                        backgroundColor: Colors.white,
                        indicatorColor: AppColors.onGoingColor,
                        tabTextColor: Colors.black45,
                        selectedTabTextColor: Colors.white,
                        squeezeIntensity: 2,
                        height: 35,
                        tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                        textStyle: Theme.of(context).textTheme.bodyLarge,

                        tabs: const [
                          SegmentTab(
                            label: 'All',
                          ),
                          SegmentTab(
                            label: 'Ongoing',
                          ),
                          SegmentTab(label: 'Completed'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: kHeight * 0.69,
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            SampleWidget(
                                label: 'FIRST PAGE',
                                color: AppColors.onGoingColor),
                            SampleWidget(
                                label: 'FIRST PAGE',
                                color: AppColors.onGoingColor),
                            SampleWidget(
                                label: 'FIRST PAGE',
                                color: AppColors.onGoingColor),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
