import 'package:d_crypto_lite/domain/entities/login_entity.dart';
import 'package:d_crypto_lite/domain/repo/auth_service_repo.dart';

class LoginUsecase {
  final AuthServiceRepo _authServiceRepo;

  const LoginUsecase(this._authServiceRepo);

  bool login(LoginEntity userCredentials) {
    final response = _authServiceRepo.login(userCredentials);
    return response;
  }
}
