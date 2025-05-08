import 'package:d_crypto_lite/data/models/Login_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IAuthServices {
  bool login(LoginModel userCredentials);
}

class AuthServices implements IAuthServices {
  @override
  bool login(LoginModel userCredentials) {
    final email = dotenv.env["EMAIL"];
    final password = dotenv.env["PASSWORD"];

    if (userCredentials.email == email && userCredentials.password == password) {
      return true;
    } else {
      return false;
    }
  }
}
