import 'package:flutter/material.dart';
import 'package:machine/constants/app_images.dart';
import 'package:machine/constants/appcolors.dart';

class UserStackWidget extends StatelessWidget {
  const UserStackWidget(
      {super.key, required this.kWidth, required this.isExtraUser});

  final double kWidth;
  final bool isExtraUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: isExtraUser ? kWidth * 0.37 : kWidth * 0.22,
        ),
        CircleAvatar(
          // radius: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              AppImages.user1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 25,
          child: CircleAvatar(
            // radius: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                AppImages.user2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 50,
          child: CircleAvatar(
            // radius: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                AppImages.user3,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        isExtraUser
            ? Positioned(
                left: 70,
                child: CircleAvatar(
                  // radius: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      AppImages.user4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        isExtraUser
            ? Positioned(
                left: 92,
                child: CircleAvatar(
                  backgroundColor: AppColors.inProgressColor,
                  radius: 20,
                  child: const Icon(Icons.add),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
