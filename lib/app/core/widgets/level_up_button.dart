import 'package:dantown_clone/app/core/constants.dart';
import 'package:dantown_clone/app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uicons/uicons.dart';

/// A prominent button widget for prompting users to upgrade or verify their account level.
///
/// Displays an icon, title, and description, styled to attract attention.
///
/// Used to encourage users to access more features by upgrading.
class LevelUpButton extends StatelessWidget {
  const LevelUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.padding),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.padding / 2,
          vertical: Constants.padding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadius / 2),
          color: AppColors.yellow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.backgroundColor,
              child: Icon(UIcons.solidRounded.crown, size: 20),
            ),

            SizedBox(width: Constants.horizontalSpacing),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upgrade to Level 1",
                    style: t.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Enjoy more benefits when you verify your account",
                    softWrap: true,
                    style: t.labelSmall?.copyWith(
                      color: AppColors.textYellow,
                      letterSpacing: 0.1,
                      fontSize: 10.0.sp,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constants.borderRadius),
                color: AppColors.backgroundColor,
              ),
              child: Text(
                "Upgrade",
                style: t.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
