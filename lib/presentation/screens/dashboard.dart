import 'package:d_crypto_lite/core/constants.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:d_crypto_lite/presentation/state/dashboard_view_model.dart';
import 'package:d_crypto_lite/presentation/widgets/coins_tile.dart';
import 'package:d_crypto_lite/presentation/widgets/custom_bottom_sheet.dart';
import 'package:d_crypto_lite/presentation/widgets/profile_avatar.dart';
import 'package:d_crypto_lite/presentation/widgets/quick_action_item.dart';
import 'package:d_crypto_lite/presentation/widgets/wallet_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    final provider = context.read<IDashboardViewModel>();
    provider.getUserProfile();
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    // final vm = context.read<IDashboardViewModel>();
    final username = context.watch<IDashboardViewModel>().username;
    final t = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: AppBar(
        titleSpacing: 10,
        scrolledUnderElevation: 0,
        actionsPadding: const EdgeInsets.only(right: Constants.horizontalPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(Constants.borderRadius)),
        ),
        leading: Padding(padding: const EdgeInsets.only(left: 20), child: ProfileAvatar()),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good evening", style: t.labelMedium?.copyWith(color: AppColors.secondaryColor)),
            Text(username ?? "", style: t.labelLarge?.copyWith(color: AppColors.primaryColor)),
          ],
        ),
        centerTitle: false,
        actions: [
          Icon(CupertinoIcons.chat_bubble_2_fill),

          const SizedBox(width: 15),

          Badge(
            smallSize: 10.0,
            backgroundColor: AppColors.secondaryColor,
            child: Icon(Icons.notifications),
          ),
        ],

        bottom: PreferredSize(preferredSize: Size.fromHeight(120), child: WalletDisplay()),
      ),

      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(Constants.borderRadius),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          blurRadius: 20,
                          spreadRadius: 5,
                          color: Color.fromARGB(255, 215, 218, 226),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quick actions",
                          style: t.bodyLarge?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            QuickActionItem(image: "assets/yyy.png", label: "Trade"),
                            QuickActionItem(
                              image:
                                  "assets/Screenshot_2025-05-09-21-33-51-545_com.dantown.Dantownapp.png",
                              label: "Virtual Card",
                            ),
                            QuickActionItem(image: "assets/ooo.png", label: "Recharge"),
                            QuickActionItem(image: "assets/hh.png", label: "More"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Ad section
                  Padding(
                    padding: const EdgeInsets.all(Constants.borderRadius),
                    child: Container(
                      width: screenWidth,
                      height: 90,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(Constants.borderRadius),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          blurRadius: 20,
                          spreadRadius: 5,
                          color: Color.fromARGB(255, 215, 218, 226),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Coin/Price",
                              style: t.labelSmall?.copyWith(color: AppColors.darkGrey),
                            ),
                            Text(
                              "24h Change",
                              style: t.labelSmall?.copyWith(color: AppColors.darkGrey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 200, // Set a fixed height or use `Expanded` if needed
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) => CoinsTile(),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showCupertinoSheet(
                              context: context,
                              pageBuilder: (context) {
                                return CustomBottomSheet();
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Show more",
                                style: t.bodyMedium?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(CupertinoIcons.chevron_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
