import 'package:d_crypto_lite/core/constants.dart';
import 'package:d_crypto_lite/core/theme.dart';
import 'package:d_crypto_lite/presentation/state/dashboard_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    final provider = context.read<IDashboardViewModel>();
    provider.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    // final vm = context.read<IDashboardViewModel>();
    final username = context.watch<IDashboardViewModel>().username;
    final t = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(backgroundImage: AssetImage("assets/headshot.png")),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good evening", style: t.labelMedium?.copyWith(color: AppColors.secondaryColor)),
            Text(username ?? "", style: t.labelLarge?.copyWith(color: AppColors.primaryColor)),
          ],
        ),
        centerTitle: false,
        actions: [
          Icon(CupertinoIcons.chat_bubble_2_fill),
          const SizedBox(width: 15),

          Badge(
            smallSize: 10.0,
            backgroundColor: AppColors.secondaryColor,
            child: Icon(Icons.notifications),
          ),
          const SizedBox(width: Constants.horizontalPadding),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: Constants.horizontalPadding,
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NET WALLET BALANCE",
                    style: t.bodyLarge?.copyWith(color: AppColors.darkGrey),
                  ),
                  Text(
                    "NGN 200,000,000",
                    style: t.bodyLarge?.copyWith(color: AppColors.primaryColor, fontSize: 18),
                  ),
                  Text("2.1230BTC", style: t.labelSmall?.copyWith(color: AppColors.darkGrey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
