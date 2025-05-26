import 'package:d_crypto_lite/app/features/home/data/services/transactions_service.dart';
import 'package:d_crypto_lite/app/features/home/domain/entities/transaction_entity.dart';
import 'package:d_crypto_lite/app/features/home/domain/entities/user_entity.dart';
import 'package:d_crypto_lite/app/features/home/domain/entities/wallet_entity.dart';
import 'package:d_crypto_lite/app/features/home/domain/repo/transaction_service_repo.dart';

class TransactionServiceRepoImpl implements TransactionServiceRepo {
  final ITransactionsService _transactionsService;

  const TransactionServiceRepoImpl(this._transactionsService);
  @override
  Future<WalletEntity> getAccountBalance() async {
    final response = await _transactionsService.getAccountBalance();
    return WalletEntity(balance: response.balance, currency: response.currency);
  }

  @override
  Future<List<TransactionEntity>> getTransactionHistory() async {
    final response = await _transactionsService.getTransactionHistory();
    return response
        .map(
          (data) => TransactionEntity(
            id: data.id,
            type: data.type,
            amount: data.amount,
            date: data.date,
            asset: data.asset,
            network: data.network,
            price: data.price,
            phone: data.phone,
          ),
        )
        .toList();
  }

  @override
  Future<UserEntity> getUserProfile() async {
    final response = await _transactionsService.getUserProfile();
    return UserEntity(
      id: response.id,
      name: response.name,
      email: response.email,
      username: response.username,
    );
  }
}
