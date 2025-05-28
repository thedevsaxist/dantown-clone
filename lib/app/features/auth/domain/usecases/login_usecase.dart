import 'package:dantown_clone/app/features/auth/domain/entities/login_entity.dart';
import 'package:dantown_clone/app/features/auth/domain/repo/auth_service_repo.dart';

class LoginUsecase {
  final AuthServiceRepo _authServiceRepo;

  const LoginUsecase(this._authServiceRepo);

  bool login(LoginEntity userCredentials) {
    final response = _authServiceRepo.login(userCredentials);
    return response;
  }
}
