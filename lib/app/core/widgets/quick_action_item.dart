import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:flutter/material.dart';

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
          height: MediaQuery.sizeOf(context).height * .08,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.lightBlue200,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Image.asset(widget.image, fit: BoxFit.cover),
        ),

        const SizedBox(height: 10),

        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.primaryColor,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
