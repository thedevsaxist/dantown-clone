import 'package:d_crypto_lite/data/repositories/auth_service_repo_impl.dart';
import 'package:d_crypto_lite/data/repositories/transaction_service_repo_impl.dart';
import 'package:d_crypto_lite/data/services/auth_services.dart';
import 'package:d_crypto_lite/data/services/transactions_service.dart';
import 'package:d_crypto_lite/domain/repo/auth_service_repo.dart';
import 'package:d_crypto_lite/domain/repo/transaction_service_repo.dart';
import 'package:d_crypto_lite/domain/usecases/get_transaction_history_usecase.dart';
import 'package:d_crypto_lite/domain/usecases/get_user_usecase.dart';
import 'package:d_crypto_lite/domain/usecases/get_wallet_balance_usecase.dart';
import 'package:d_crypto_lite/domain/usecases/login_usecase.dart';
import 'package:d_crypto_lite/presentation/state/login_screen_view_model.dart';
import 'package:d_crypto_lite/presentation/state/sign_up_screen_view_model.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void serviceLocator() {
  // services
  sl.registerLazySingleton<IAuthServices>(() => AuthServices());
  sl.registerLazySingleton<ITransactionsService>(() => TransactionsService());

  // repositories
  sl.registerLazySingleton<AuthServiceRepo>(() => AuthServiceRepoImpl(sl<IAuthServices>()));
  sl.registerLazySingleton<TransactionServiceRepo>(
    () => TransactionServiceRepoImpl(sl<ITransactionsService>()),
  );

  // usecases
  sl.registerFactory<LoginUsecase>(() => LoginUsecase(sl<AuthServiceRepo>()));
  sl.registerFactory<GetUserUsecase>(() => GetUserUsecase(sl<TransactionServiceRepo>()));
  sl.registerFactory<GetTransactionHistoryUsecase>(
    () => GetTransactionHistoryUsecase(sl<TransactionServiceRepo>()),
  );
  sl.registerFactory<GetWalletBalanceUsecase>(
    () => GetWalletBalanceUsecase(sl<TransactionServiceRepo>()),
  );

  // viewmodels
  sl.registerLazySingleton<ILoginScreenViewModel>(() => LoginScreenViewModel(sl<LoginUsecase>()));
  sl.registerLazySingleton<ISignUpScreenViewModel>(() => SignUpScreenViewModel());
}
