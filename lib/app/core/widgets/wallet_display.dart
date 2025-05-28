import 'package:dantown_clone/app/core/constants.dart';
import 'package:dantown_clone/app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add this import

/// Displays the user's wallet balance and related information.
///
/// Includes a visibility toggle for sensitive data and a customizable trailing widget.
///
/// Used in dashboards or wallet overview screens.
class WalletDisplay extends StatefulWidget {
  final Widget trailing;
  const WalletDisplay({super.key, required this.trailing});

  @override
  State<WalletDisplay> createState() => _WalletDisplayState();
}

class _WalletDisplayState extends State<WalletDisplay> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w), // Responsive padding
      child: Container(
        padding: EdgeInsets.all(15.r), // Responsive padding
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(Constants.borderRadius.r), // Responsive border radius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "NET WALLET BALANCE",
                      style: t.bodyMedium?.copyWith(
                        color: AppColors.darkGrey,
                        fontSize: 14.sp,
                      ), // Responsive font size
                    ),
                    SizedBox(width: 10.w), // Responsive spacing
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        size: 20.sp, // Responsive icon size
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h), // Responsive spacing
                Text(
                  isVisible ? "NGN 200,000,000" : "****",
                  style: t.bodyLarge?.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 18.sp, // Responsive font size
                  ),
                ),
                Text(
                  isVisible ? "2.1230BTC" : "",
                  style: t.labelSmall?.copyWith(
                    color: AppColors.darkGrey,
                    fontSize: 12.sp, // Responsive font size
                  ),
                ),
              ],
            ),
            widget.trailing,
          ],
        ),
      ),
    );
  }
}
