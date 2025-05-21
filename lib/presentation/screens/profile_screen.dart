import 'package:d_crypto_lite/core/constants.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:d_crypto_lite/models/profile_setting.dart';
import 'package:d_crypto_lite/presentation/widgets/level_up_button.dart';
import 'package:d_crypto_lite/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

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

              SizedBox(height: Constants.verticalSpacing),

              Flexible(
                fit: FlexFit.loose,
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
                          // child: SizedBox(height: 10, width: 10),
                          child: Placeholder(fallbackHeight: 180, color: AppColors.primaryColor),
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

                        Positioned(top: 30, child: ProfileAvatar()),

                        Text(
                          "Chidiebube Iroezindu",
                          style: t.titleLarge?.copyWith(
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: Constants.verticalSpacing),

              Flexible(
                fit: FlexFit.loose,
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(Constants.padding),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Constants.borderRadius),
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
                              SizedBox(height: Constants.horizontalSpacing),
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
      padding: const EdgeInsets.all(Constants.padding),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(Constants.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.backgroundColor,
            child: Icon(icon, color: AppColors.purple),
          ),

          SizedBox(height: Constants.verticalSpacing),
          Text(title, style: t.titleLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
          Text(subtitle, style: t.labelMedium?.copyWith(color: AppColors.textPurple, height: 2)),
        ],
      ),
    );
  }
}

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
