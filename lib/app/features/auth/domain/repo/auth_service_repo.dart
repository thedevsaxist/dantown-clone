import 'package:d_crypto_lite/app/features/auth/domain/entities/login_entity.dart';

abstract class AuthServiceRepo {
  bool login(LoginEntity userCredentials);
}
