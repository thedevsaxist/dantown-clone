import 'package:d_crypto_lite/core/routes.dart';
import 'package:d_crypto_lite/presentation/screens/auth_interface.dart';
import 'package:d_crypto_lite/presentation/screens/dashboard.dart';
import 'package:d_crypto_lite/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static config() => GoRouter(
    initialLocation: Routes.authInterface,
    routes: [
      GoRoute(path: Routes.authInterface, builder: (context, state) => const AuthInterface()),
      GoRoute(path: Routes.loginScreen, builder: (context, state) => const LoginScreen()),
      GoRoute(path: Routes.dashboard, builder: (context, state) => const Dashboard()),
    ],
  );
}
