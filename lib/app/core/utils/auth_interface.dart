import 'package:d_crypto_lite/app/core/gen/assets.gen.dart';
import 'package:d_crypto_lite/app/core/theme.dart';
import 'package:d_crypto_lite/app/features/auth/presentation/screens/login_screen.dart';
import 'package:d_crypto_lite/app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AuthInterface extends StatefulWidget {
  const AuthInterface({super.key});

  @override
  State<AuthInterface> createState() => _AuthInterfaceState();
}

class _AuthInterfaceState extends State<AuthInterface> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Assets.logos.dantownLogo.image(),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelStyle: t.bodyLarge?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: AppColors.secondaryColor,
            indicatorColor: AppColors.primaryColor,
            dividerColor: AppColors.backgroundColor,
            tabs: [Tab(text: "Log In"), Tab(text: "Sign Up")],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: TabBarView(controller: _tabController, children: [LoginScreen(), SignUpScreen()]),
        ),
      ),
    );
  }
}
