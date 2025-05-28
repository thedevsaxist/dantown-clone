import 'router_barrel.dart';

/// Provides the application's routing configuration using [GoRouter].
///
/// The [Routers] class contains a static [config] method that returns a [GoRouter]
/// instance configured with all the app's routes, authentication redirects, and
/// navigation structure.
///
/// - Handles authentication-based redirects:
///   - Unauthenticated users are redirected to the [Routes.authInterface].
///   - Authenticated users attempting to access the auth interface are redirected to [Routes.dashboard].
/// - Defines all main routes, including login, sign up, and the main dashboard.
/// - Uses [StatefulShellRoute] with an indexed stack for bottom navigation,
///   organizing the app into branches for dashboard, buy/sell, airtime, and profile screens.
///
/// Example usage:
/// ```dart
/// final router = Routers.config(authService);
/// ```
class Routers {
  /// Returns a [GoRouter] configured with all routes and authentication logic.
  ///
  /// [auth] is an implementation of [IAuthServices] used to determine authentication state.
  static GoRouter config(IAuthServices auth) => GoRouter(
    initialLocation: Routes.authInterface,
    refreshListenable: auth,
    redirect: (context, state) {
      final attemptingLogin = state.uri.path == Routes.authInterface;
      final isAuthenticated = auth.isLoggedIn;
      if (!attemptingLogin && !isAuthenticated) {
        return Routes.authInterface;
      }

      if (attemptingLogin && isAuthenticated) {
        return Routes.dashboard;
      }

      return null;
    },
    routes: [
      GoRoute(path: Routes.loginScreen, builder: (context, state) => const LoginScreen()),
      GoRoute(path: Routes.signUpScreen, builder: (context, state) => const SignUpScreen()),
      GoRoute(path: Routes.authInterface, builder: (context, state) => const AuthInterface()),

      StatefulShellRoute.indexedStack(
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
    ],
  );
}
