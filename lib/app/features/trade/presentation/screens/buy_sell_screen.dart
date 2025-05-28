import 'package:d_crypto_lite/app/core/gen/assets.gen.dart';
import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:d_crypto_lite/app/core/widgets/wallet_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({super.key});

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {
  int _selectedTab = 0;
  int _previousTab = 0; // don't remove this line

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        title: Text("Wallets"),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(20.r),
          ), // Responsive border radius
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(250.h), // Responsive height
          child: Column(
            children: [
              WalletDisplay(
                trailing: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 2.h,
                  ), // Responsive padding
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(8.r), // Responsive border radius
                  ),
                  child: Row(
                    children: [
                      Text("NGN", style: t.bodyMedium),
                      Icon(Icons.keyboard_arrow_down_rounded, size: 18.sp),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ), // Responsive padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My balances",
                      style: t.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See Details",
                      style: t.labelSmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 30.h,
                ), // Responsive padding
                child: Row(
                  children: [
                    _Balance(
                      label: "Trading",
                      icon: Assets.images.exchange.image(scale: 17),
                      balance: "0.00",
                      showBottom: true,
                    ),

                    SizedBox(width: 10.w), // Responsive spacing

                    _Balance(
                      label: "Virtual Card",
                      icon: Assets.images.virtualCard.image(scale: 6),
                      balance: "0.00",
                      showBottom: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.h), // Responsive padding
        child: Container(
          padding: EdgeInsets.all(20.w), // Responsive padding
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ), // Responsive border radius
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (_selectedTab != 0) {
                                setState(() {
                                  _previousTab = _selectedTab;
                                  _selectedTab = 0;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  _selectedTab == 0 ? AppColors.primaryColor : Colors.grey,
                              textStyle: t.labelLarge,
                            ),
                            child: Text("Wallet"),
                          ),
                          Container(
                            height: 3.h, // Responsive height
                            width: 50.w, // Responsive width
                            decoration: BoxDecoration(
                              color:
                                  _selectedTab == 0 ? AppColors.primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(2.r), // Responsive border radius
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12.w), // Responsive spacing
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (_selectedTab != 1) {
                                setState(() {
                                  _previousTab = _selectedTab;
                                  _selectedTab = 1;
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  _selectedTab == 1 ? AppColors.primaryColor : Colors.grey,
                              textStyle: t.labelLarge,
                            ),
                            child: Text("Transaction History"),
                          ),
                          Container(
                            height: 3.h, // Responsive height
                            width: 130.w, // Responsive width
                            decoration: BoxDecoration(
                              color:
                                  _selectedTab == 1 ? AppColors.primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(2.r), // Responsive border radius
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColors.primaryColor,
                      size: 22.sp,
                    ), // Responsive icon size
                    onPressed: () {
                      // TODO: Implement search action
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h), // Responsive spacing
              _selectedTab == 0
                  ? Center(child: Text("Wallet Content"))
                  : Center(child: Text("Transaction History Content")),
            ],
          ),
        ),
      ),
    );
  }
}

class _Balance extends StatelessWidget {
  final String label;
  final Widget icon;
  final String balance;
  final bool? showBottom;

  const _Balance({
    required this.label,
    required this.icon,
    required this.balance,
    required this.showBottom,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.w), // Responsive padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), // Responsive border radius
          color: AppColors.lightBlue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0.w,
                    ), // Responsive border width
                    shape: BoxShape.circle,
                  ),
                  child: icon,
                ),
                SizedBox(width: 6.w), // Responsive spacing
                Text(label, style: t.bodyMedium),
              ],
            ),
            SizedBox(height: 6.h), // Responsive spacing
            Text("NGN $balance", style: t.titleLarge),

            Row(
              children: [
                Text(
                  "0.0%",
                  style: t.labelSmall?.copyWith(color: AppColors.green, fontSize: 10.sp),
                ), // Responsive font size
                Icon(
                  Icons.arrow_drop_up_rounded,
                  color: AppColors.green,
                  size: 16.sp,
                ), // Responsive icon size
                Text(
                  "Growth this month.",
                  style: t.labelSmall?.copyWith(fontSize: 10.sp),
                ), // Responsive font size
              ],
            ),
          ],
        ),
      ),
    );
  }
}
