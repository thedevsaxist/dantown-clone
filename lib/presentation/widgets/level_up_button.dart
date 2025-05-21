import 'package:d_crypto_lite/core/constants.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class LevelUpButton extends StatelessWidget {
  const LevelUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
      child: Container(
        padding: const EdgeInsets.symmetric(
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
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
    
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
