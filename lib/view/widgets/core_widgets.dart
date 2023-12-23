import 'package:flutter/material.dart';
import 'package:machine/constants/app_images.dart';

class CoreWidgets {
  /// Custom app bar widget
  static AppBar appBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        padding: const EdgeInsets.only(
            top: 5.0, left: 10, right: 10), // Adjust appbar padding here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  AppImages.userIcon,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
