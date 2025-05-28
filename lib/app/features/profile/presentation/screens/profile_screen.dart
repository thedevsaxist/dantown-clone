import 'package:dantown_clone/app/core/constants.dart';
import 'package:dantown_clone/app/core/theme.dart';
import 'package:dantown_clone/app/features/profile/data/models/profile_setting.dart';
import 'package:dantown_clone/app/core/widgets/level_up_button.dart';
import 'package:dantown_clone/app/core/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add this import

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<ProfileSetting> _settings = [
    ProfileSetting(
      icon: Icons.person,
      title: "Personal Profile",
      subtitle: "Setting, display name, email, password, etc",
    ),
    ProfileSetting(
      icon: Icons.verified,
      title: "Verification",
      subtitle: "Enjoy more benefits when you verify your account",
    ),
    ProfileSetting(
      icon: UIcons.solidRounded.shield_plus,
      title: "Privacy Policy",
      subtitle: "Read and understand our terms of service.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(fit: FlexFit.loose, flex: 1, child: LevelUpButton()),

              SizedBox(height: Constants.verticalSpacing.h),

              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constants.padding.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Constants.borderRadius.r),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Constants.borderRadius.r),
                            color: AppColors.primaryColor,
                          ),
                          child: Placeholder(fallbackHeight: 180.h, color: AppColors.primaryColor),
                        ),

                        Positioned(
                          bottom: -210.h,
                          child: Container(
                            width: 370.w,
                            height: 370.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ),

                        Positioned(top: 30.h, child: ProfileAvatar()),

                        Text(
                          "Chidiebube Iroezindu",
                          style: t.titleLarge?.copyWith(
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: t.titleLarge?.fontSize?.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: Constants.verticalSpacing.h),

              Flexible(
                fit: FlexFit.loose,
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(Constants.padding.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Constants.borderRadius.r),
                    color: AppColors.backgroundColor,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ..._settings.asMap().entries.map((entry) {
                        final idx = entry.key;
                        final setting = entry.value;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SettingsOptions(
                              icon: setting.icon,
                              title: setting.title,
                              subtitle: setting.subtitle,
                            ),
                            // Add spacing except after the last item
                            if (idx != _settings.length - 1)
                              SizedBox(height: Constants.horizontalSpacing.h),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsOptions({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(Constants.padding.w),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(Constants.borderRadius.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.backgroundColor,
            child: Icon(icon, color: AppColors.purple),
            radius: 24.r,
          ),

          SizedBox(height: Constants.verticalSpacing.h),
          Text(title, style: t.titleLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp)),
          Text(
            subtitle,
            style: t.labelMedium?.copyWith(
              color: AppColors.textPurple,
              height: 2,
              fontSize: t.labelMedium?.fontSize?.sp,
            ),
          ),
        ],
      ),
    );
  }
}
