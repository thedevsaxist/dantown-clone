import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:d_crypto_lite/app/core/widgets/coins_tile.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {

  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 100,
              height: 5,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coin/Price", style: t.labelSmall?.copyWith(color: AppColors.darkGrey)),
                Text("24h Change", style: t.labelSmall?.copyWith(color: AppColors.darkGrey)),
              ],
            ),

            const SizedBox(height: 10),

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
