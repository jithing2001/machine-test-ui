import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine/constants/appcolors.dart';
import 'package:machine/controller/nav_controller.dart';
import 'package:machine/view/home/homescreen.dart';
import 'package:machine/view/project/project_screen.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Navigation extends StatelessWidget {
  Navigation({
    Key? key,
  }) : super(key: key);

  PageController controller = PageController();

  //GetxController
  NavController navController = Get.put(NavController());

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent

      bottomNavigationBar: Obx(() {
        return StylishBottomBar(
          option: AnimatedBarOptions(
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.animated,
          ),
          items: [
            BottomBarItem(
                icon: const Icon(
                  Icons.house_outlined,
                ),
                selectedIcon: const Icon(Icons.house_rounded),
                selectedColor: AppColors.onGoingColor,
                unSelectedColor: Colors.grey,
                title: const Text('')),
            BottomBarItem(
                icon: const Icon(Icons.description),
                selectedColor: AppColors.onGoingColor,
                unSelectedColor: Colors.grey,
                title: const Text('')),
            BottomBarItem(
                icon: const Icon(
                  Icons.mail,
                ),
                selectedIcon: const Icon(
                  Icons.mail,
                ),
                selectedColor: AppColors.onGoingColor,
                unSelectedColor: Colors.grey,
                title: const Text('')),
            BottomBarItem(
                icon: const Icon(
                  Icons.settings,
                ),
                selectedIcon: const Icon(
                  Icons.settings,
                ),
                selectedColor: AppColors.onGoingColor,
                unSelectedColor: Colors.grey,
                title: const Text('')),
          ],
          hasNotch: true,
          fabLocation: StylishBarFabLocation.center,
          currentIndex: navController.selectedIndex.value,
          onTap: (index) {
            controller.jumpToPage(index);
            //it updating the index to selectedindex
            navController.changeIcon(index);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //change the floating action button icon
          navController.changeFloatingIcon();
        },
        backgroundColor: AppColors.onGoingColor,
        child: Obx(() {
          return Icon(
            navController.addIcon.value
                ? CupertinoIcons.add_circled
                : CupertinoIcons.add,
            color: Colors.white,
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            HomeScreen(),
            const ProjectScreen(),
            const Center(child: Text('Inbox')),
            const Center(child: Text('Settings')),
          ],
        ),
      ),
    );
  }
}
