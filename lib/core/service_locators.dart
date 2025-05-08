import 'package:d_crypto_lite/presentation/state/login_screen_view_model.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void serviceLocator() {
  sl.registerLazySingleton<ILoginScreenViewModel>(() => LoginScreenViewModel());
}
