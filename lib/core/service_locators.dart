import 'package:d_crypto_lite/presentation/state/login_screen_view_model.dart';
import 'package:d_crypto_lite/presentation/state/sign_up_screen_view_model.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void serviceLocator() {
  sl.registerLazySingleton<ILoginScreenViewModel>(() => LoginScreenViewModel());

  sl.registerLazySingleton<ISignUpScreenViewModel>(() => SignUpScreenViewModel());
}
