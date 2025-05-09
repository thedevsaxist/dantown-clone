import 'package:d_crypto_lite/core/constants.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:flutter/material.dart';

class WalletDisplay extends StatefulWidget {
  const WalletDisplay({super.key});

  @override
  State<WalletDisplay> createState() => _WalletDisplayState();
}

class _WalletDisplayState extends State<WalletDisplay> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(Constants.borderRadius),
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
                      style: t.bodyMedium?.copyWith(color: AppColors.darkGrey),
                    ),

                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(isVisible ? Icons.visibility : Icons.visibility_off, size: 20),
                    ),
                  ],
                ),

                const SizedBox(height: 4),
                Text(
                  isVisible ? "NGN 200,000,000" : "****",
                  style: t.bodyLarge?.copyWith(color: AppColors.primaryColor, fontSize: 18),
                ),
                Text(
                  isVisible ? "2.1230BTC" : "",
                  style: t.labelSmall?.copyWith(color: AppColors.darkGrey),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                "Deposit",
                style: t.labelLarge?.copyWith(color: AppColors.backgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
