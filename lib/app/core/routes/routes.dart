/// Defines all the named route paths used throughout the application.
///
/// This class provides static constants for each route, ensuring consistency
/// and reducing the risk of typos when navigating between screens.
///
/// Example usage:
/// ```dart
/// Navigator.pushNamed(context, Routes.loginScreen);
/// ```
class Routes {
  static const authInterface = "/auth_interface";
  static const bottomNavBar = "/bottom_nav_bar";
  static const loginScreen = "/login";
  static const signUpScreen = "/sign_up";
  static const dashboard = "/dashboard";
  static const buySellScreen = "/buy_sell_screen";
  static const airtimeScreen = "/airtime_screen";
  static const profileScreen = "/profile_screen";
}
