import 'package:d_crypto_lite/core/routes.dart';
import 'package:d_crypto_lite/core/utils/auth_interface.dart';
import 'package:d_crypto_lite/core/utils/bottom_nav_bar.dart';
import 'package:d_crypto_lite/presentation/screens/airtime_screen.dart';
import 'package:d_crypto_lite/presentation/screens/buy_sell_screen.dart';
import 'package:d_crypto_lite/presentation/screens/dashboard.dart';
import 'package:d_crypto_lite/presentation/screens/login_screen.dart';
import 'package:d_crypto_lite/presentation/screens/profile_screen.dart';
import 'package:d_crypto_lite/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<StatefulNavigationShellState>();
  static GoRouter config() => GoRouter(
    initialLocation: Routes.authInterface,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(path: Routes.loginScreen, builder: (context, state) => const LoginScreen()),
      GoRoute(path: Routes.signUpScreen, builder: (context, state) => const SignUpScreen()),
      GoRoute(path: Routes.authInterface, builder: (context, state) => const AuthInterface()),

      StatefulShellRoute.indexedStack(
        key: _shellNavigatorKey,
        builder: (context, state, currentScreen) => BottomNavBar(child: currentScreen),
        branches: [
          StatefulShellBranch(
            initialLocation: Routes.dashboard,
            routes: [
              GoRoute(path: Routes.dashboard, builder: (context, state) => const Dashboard()),
            ],
          ),
          StatefulShellBranch(
            initialLocation: Routes.buySellScreen,
            routes: [
              GoRoute(
                path: Routes.buySellScreen,
                builder: (context, state) => const BuySellScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: Routes.airtimeScreen,
            routes: [
              GoRoute(
                path: Routes.airtimeScreen,
                builder: (context, state) => const AirtimeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: Routes.profileScreen,
            routes: [
              GoRoute(
                path: Routes.profileScreen,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   builder: (context, state, child) => BottomNavBar(child: child),
      //   routes: [
      //     GoRoute(path: Routes.dashboard, builder: (context, state) => const Dashboard()),
      //     GoRoute(path: Routes.airtimeScreen, builder: (context, state) => const AirtimeScreen()),
      //     GoRoute(path: Routes.buySellScreen, builder: (context, state) => const BuySellScreen()),
      //     GoRoute(path: Routes.profileScreen, builder: (context, state) => const ProfileScreen()),
      //   ],
      // ),
    ],
  );
}
