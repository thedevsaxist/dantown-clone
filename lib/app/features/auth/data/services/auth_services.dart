import 'package:dantown_clone/app/features/auth/data/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IAuthServices extends ChangeNotifier with AuthStatus {
  bool login(LoginModel userCredentials);
  // bool get isLoggedIn;
}

class AuthServices extends ChangeNotifier with AuthStatus implements IAuthServices {
  // bool _isLoggedIn = false;

  // @override
  // bool get isLoggedIn => _isLoggedIn;

  @override
  bool login(LoginModel userCredentials) {
    final email = dotenv.env["EMAIL"];
    final password = dotenv.env["PASSWORD"];

    if (userCredentials.email == email && userCredentials.password == password) {
      // _isLoggedIn = !_isLoggedIn;
      // notifyListeners();
      loggedIn();
      return true;
    } else {
      return false;
    }
  }
}

mixin AuthStatus on ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  void loggedIn() {
    _isLoggedIn = !_isLoggedIn;
    notifyListeners();

    print("user is logged in: $_isLoggedIn");
  }
}
