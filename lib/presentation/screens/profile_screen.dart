import 'package:d_crypto_lite/core/constants.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          children: [
            LevelUpButton(),

            SizedBox(height: Constants.verticalSpacing),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Constants.padding),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Constants.borderRadius),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Constants.borderRadius),
                          color: AppColors.primaryColor,
                        ),
                      ),

                      Positioned(
                        bottom: -210,
                        child: Container(
                          width: 370,
                          height: 370,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: Constants.verticalSpacing),

            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Constants.borderRadius),
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelUpButton extends StatelessWidget {
  const LevelUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Expanded(
      flex: 1,
      child: Padding(
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

        // ListTile(
        //   tileColor: AppColors.yellow,
        //   trailing: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(Constants.borderRadius),
        //       color: AppColors.backgroundColor,
        //     ),
        //     child: Text(
        //       "Upgrade",
        //       style: t.bodyMedium?.copyWith(
        //         color: AppColors.primaryColor,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        //   title: Text("Upgrade to Level 1"),
        //   titleTextStyle: t.bodyLarge?.copyWith(
        //     color: AppColors.primaryColor,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   subtitle: Text("Enjoy more benefits when you verify your account"),
        //   subtitleTextStyle: t.labelSmall?.copyWith(
        //     color: AppColors.textYellow,
        //     letterSpacing: 0.1,
        //     fontSize: 10.0,
        //   ),
        //   leading: CircleAvatar(
        //     backgroundColor: AppColors.backgroundColor,
        //     child: Icon(UIcons.solidRounded.crown, size: 20),
        //   ),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(Constants.borderRadius),
        //   ),
        // ),
      ),
    );
  }
}
