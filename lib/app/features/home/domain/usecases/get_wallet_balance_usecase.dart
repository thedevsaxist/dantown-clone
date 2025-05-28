import 'package:dantown_clone/app/features/home/domain/entities/wallet_entity.dart';
import 'package:dantown_clone/app/features/home/domain/repo/transaction_service_repo.dart';

class GetWalletBalanceUsecase {
  final TransactionServiceRepo _transactionServiceRepo;

  const GetWalletBalanceUsecase(this._transactionServiceRepo);

  Future<WalletEntity> call() async {
    try {
      final balance = await _transactionServiceRepo.getAccountBalance();
      return balance;
    } catch (e) {
      throw Exception(e);
    }
  }
}
