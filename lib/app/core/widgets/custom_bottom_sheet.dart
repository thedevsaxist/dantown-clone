import 'package:dantown_clone/app/core/theme.dart';
import 'package:dantown_clone/app/core/widgets/coins_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add this import

/// A reusable bottom sheet widget for displaying content in a modal overlay.
///
/// Typically used to show lists of coins, actions, or additional information.
///
/// Includes a drag handle and a customizable content area.
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h), // Responsive padding
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ), // Responsive border radius
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 100.w, // Responsive width
              height: 5.h, // Responsive height
              margin: EdgeInsets.only(bottom: 10.h), // Responsive margin
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(12.r), // Responsive border radius
              ),
            ),

            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coin/Price",
                  style: t.labelSmall?.copyWith(color: AppColors.darkGrey, fontSize: 12.sp),
                ), // Responsive font size
                Text(
                  "24h Change",
                  style: t.labelSmall?.copyWith(color: AppColors.darkGrey, fontSize: 12.sp),
                ), // Responsive font size
              ],
            ),

            SizedBox(height: 10.h), // Responsive spacing
            // Dynamic list of coins
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return CoinsTile(); // Replace with dynamic data if needed
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
