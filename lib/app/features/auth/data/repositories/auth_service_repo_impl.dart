import 'package:dantown_clone/app/features/auth/data/models/login_model.dart';
import 'package:dantown_clone/app/features/auth/data/services/auth_services.dart';
import 'package:dantown_clone/app/features/auth/domain/entities/login_entity.dart';
import 'package:dantown_clone/app/features/auth/domain/repo/auth_service_repo.dart';

class AuthServiceRepoImpl implements AuthServiceRepo {
  final IAuthServices _authServices;

  const AuthServiceRepoImpl(this._authServices);

  @override
  bool login(LoginEntity userCredentials) {
    try {
      final response = _authServices.login(
        LoginModel(
          email: userCredentials.email,
          password: userCredentials.password,
        ), // the LoginModel.tojson method will normally be used here
      );

      return response;
    } on Exception {
      rethrow;
    }
  }
}
