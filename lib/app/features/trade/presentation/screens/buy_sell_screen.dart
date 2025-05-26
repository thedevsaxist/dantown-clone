import 'package:d_crypto_lite/app/core/gen/assets.gen.dart';
import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:d_crypto_lite/app/core/widgets/wallet_display.dart';
import 'package:flutter/material.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({super.key});

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {
  int _selectedTab = 0;
  int _previousTab = 0; // Add this line

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        title: Text("Wallets"),
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(bottom: Radius.circular(20)),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: Column(
            children: [
              WalletDisplay(
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(children: [Text("NGN"), Icon(Icons.keyboard_arrow_down_rounded)]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
                child: Row(
                  children: [
                    _Balance(
                      label: "Trading",
                      icon: Assets.images.exchange.image(scale: 17),
                      balance: "0.00",
                      showBottom: true,
                    ),

                    SizedBox(width: 10),

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
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                            height: 3,
                            width: 50,
                            decoration: BoxDecoration(
                              color:
                                  _selectedTab == 0 ? AppColors.primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
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
                            height: 3,
                            width: 130,
                            decoration: BoxDecoration(
                              color:
                                  _selectedTab == 1 ? AppColors.primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: AppColors.primaryColor),
                    onPressed: () {
                      // TODO: Implement search action
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
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
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
                    border: Border.all(color: Colors.white, width: 3.0),
                    shape: BoxShape.circle,
                  ),
                  child: icon,
                ),
                Text(label, style: t.bodyMedium),
              ],
            ),
            Text("NGN $balance", style: t.titleLarge),

            Row(
              children: [
                Text("0.0%", style: t.labelSmall?.copyWith(color: AppColors.green, fontSize: 10)),
                Icon(Icons.arrow_drop_up_rounded, color: AppColors.green),
                Text("Growth this month.", style: t.labelSmall?.copyWith(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
