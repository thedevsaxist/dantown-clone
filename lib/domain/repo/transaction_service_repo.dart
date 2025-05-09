import '../entities/transaction_entity.dart';
import '../entities/user_entity.dart';
import '../entities/wallet_entity.dart';

abstract class TransactionServiceRepo {
  Future<List<TransactionEntity>> getTransactionHistory();
  Future<UserEntity> getUserProfile();
  Future<WalletEntity> getAccountBalance();
}