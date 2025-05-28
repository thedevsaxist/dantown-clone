import 'package:dantown_clone/app/features/auth/domain/entities/login_entity.dart';

abstract class AuthServiceRepo {
  bool login(LoginEntity userCredentials);
}
