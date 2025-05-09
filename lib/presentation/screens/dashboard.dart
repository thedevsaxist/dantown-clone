import 'package:d_crypto_lite/core/constants.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:d_crypto_lite/presentation/state/dashboard_view_model.dart';
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
    return Scaffold(
      backgroundColor: AppColors.secondaryBackgroundColor,
      appBar: AppBar(
        // leadingWidth: 35,
        titleSpacing: 10,
        scrolledUnderElevation: 0,
        actionsPadding: const EdgeInsets.only(right: Constants.horizontalPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(Constants.borderRadius)),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(foregroundImage: AssetImage("assets/headshot.png")),
        ),
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

      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(Constants.borderRadius),
                boxShadow: [BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 8, spreadRadius: 1)],
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

                  const SizedBox(height: 12),

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
          ],
        ),
      ),
    );
  }
}
