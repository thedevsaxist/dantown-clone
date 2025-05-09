import 'package:d_crypto_lite/domain/entities/transaction_entity.dart';
import 'package:d_crypto_lite/domain/repo/transaction_service_repo.dart';

class GetTransactionHistoryUsecase {
  final TransactionServiceRepo _transactionServiceRepo;

  const GetTransactionHistoryUsecase(this._transactionServiceRepo);

  Future<List<TransactionEntity>> call() async {
    try {
      final history = await _transactionServiceRepo.getTransactionHistory();
      return history;
    } catch (e) {
      throw Exception(e);
    }
  }
}
