import 'package:dantown_clone/app/core/constants.dart';
import 'package:dantown_clone/app/core/gen/assets.gen.dart';
import 'package:dantown_clone/app/core/theme.dart';
import 'package:dantown_clone/app/features/home/presentation/state/dashboard_view_model.dart';
import 'package:dantown_clone/app/core/widgets/coins_tile.dart';
import 'package:dantown_clone/app/core/widgets/custom_bottom_sheet.dart';
import 'package:dantown_clone/app/core/widgets/profile_avatar.dart';
import 'package:dantown_clone/app/core/widgets/quick_action_item.dart';
import 'package:dantown_clone/app/core/widgets/wallet_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        titleSpacing: 10.w,
        scrolledUnderElevation: 0,
        actionsPadding: EdgeInsets.only(right: Constants.horizontalPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(Constants.borderRadius)),
        ),
        leading: Padding(padding: EdgeInsets.only(left: 20.r), child: ProfileAvatar()),
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

          SizedBox(width: 15.w),

          Badge(
            smallSize: 10.0.r,
            backgroundColor: AppColors.secondaryColor,
            child: Icon(Icons.notifications),
          ),
        ],

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: WalletDisplay(
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 15.0.w),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
              child: Text(
                "Deposit",
                style: t.labelLarge?.copyWith(color: AppColors.backgroundColor),
              ),
            ),
          ),
        ),
      ),

      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
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
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            QuickActionItem(image: Assets.images.trade.path, label: "Trade"),
                            QuickActionItem(
                              image: Assets.images.virtualCard.path,
                              label: "Virtual Card",
                            ),
                            QuickActionItem(image: Assets.images.recharge.path, label: "Recharge"),
                            QuickActionItem(image: Assets.images.more.path, label: "More"),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Ad section
                  Padding(
                    padding: EdgeInsets.all(Constants.borderRadius),
                    child: Container(
                      width: screenWidth,
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),

                  Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(Constants.borderRadius),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          blurRadius: 20.r,
                          spreadRadius: 5.r,
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
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 200.h,
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
                              SizedBox(width: 5.w),
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
