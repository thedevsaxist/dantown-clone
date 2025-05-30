import 'package:dantown_clone/app/features/home/domain/entities/transaction_entity.dart';
import 'package:dantown_clone/app/features/home/domain/repo/transaction_service_repo.dart';

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
