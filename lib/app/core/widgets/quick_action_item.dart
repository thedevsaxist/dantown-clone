import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add this import

/// A widget representing a quick action shortcut with an icon and label.
///
/// Used in dashboards or menus to provide fast access to frequent actions.
class QuickActionItem extends StatefulWidget {
  final String image;
  final String label;
  const QuickActionItem({super.key, required this.image, required this.label});

  @override
  State<QuickActionItem> createState() => _QuickActionItemState();
}

class _QuickActionItemState extends State<QuickActionItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h, // Responsive height
          width: 60.w, // Responsive width for square shape
          padding: EdgeInsets.all(8.r), // Responsive padding
          decoration: BoxDecoration(
            color: AppColors.lightBlue200,
            borderRadius: BorderRadius.circular(18.r), // Responsive border radius
          ),
          child: Image.asset(widget.image, fit: BoxFit.cover),
        ),

        SizedBox(height: 10.h), // Responsive spacing

        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.primaryColor,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp, // Responsive font size
          ),
        ),
      ],
    );
  }
}
