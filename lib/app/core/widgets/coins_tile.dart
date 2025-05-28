import 'package:dantown_clone/app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add this import
import 'package:google_fonts/google_fonts.dart';

/// Displays a tile representing a cryptocurrency, including its name, price,
/// and 24-hour change.
///
/// Used in lists to show multiple coins with their respective data.
class CoinsTile extends StatelessWidget {
  const CoinsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return ListTile(
      minTileHeight: 76.h, // Responsive min height
      leading: CircleAvatar(
        radius: 22.r, // Responsive avatar radius
        foregroundColor: AppColors.darkGrey,
      ),
      title: Text("DOGE"),
      titleTextStyle: t.bodyLarge?.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp, // Responsive font size
      ),
      subtitle: Text("NGN 345.76"),
      subtitleTextStyle: GoogleFonts.poppins(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
        fontSize: 12.sp, // Responsive font size
      ),
      isThreeLine: true,
      contentPadding: EdgeInsets.only(left: 0.w), // Responsive padding
      trailing: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h), // Responsive padding
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), // Responsive border radius
              color: AppColors.green,
            ),
            child: Text(
              "+11.99%",
              style: t.labelLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp, // Responsive font size
              ),
            ),
          ),

          SizedBox(height: 6.h), // Responsive spacing

          Text(
            "+NGN 38.41",
            style: t.labelMedium?.copyWith(
              color: AppColors.textGreen,
              fontSize: 12.sp, // Responsive font size
            ),
          ),
        ],
      ),
    );
  }
}
