import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:d_crypto_lite/app/core/widgets/wallet_display.dart';
import 'package:flutter/material.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({super.key});

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Wallets"),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: WalletDisplay(
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(children: [Text("NGN"), Icon(Icons.keyboard_arrow_down_rounded)]),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
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

            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightBlue,
                    ),
                    child: Column(children: [Row(children: [
                      
                    ]), Text("NGN 0.00")]),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.lightBlue,
                    ),
                    child: Column(children: [Text("NGN 0.00")]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
