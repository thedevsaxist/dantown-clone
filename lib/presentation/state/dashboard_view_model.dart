import 'package:d_crypto_lite/domain/entities/transaction_entity.dart';
import 'package:d_crypto_lite/domain/usecases/get_transaction_history_usecase.dart';
import 'package:d_crypto_lite/domain/usecases/get_user_usecase.dart';
import 'package:d_crypto_lite/domain/usecases/get_wallet_balance_usecase.dart';
import 'package:flutter/widgets.dart';

abstract class IDashboardViewModel extends ChangeNotifier {
  String? get username;

  Future<List<TransactionEntity>> getTransactionHistory();
  Future<void> getUserProfile();
  Future<void> getAccountBalance();
}

class DashboardViewModel extends ChangeNotifier implements IDashboardViewModel {
  final GetUserUsecase _userUsecase;
  final GetWalletBalanceUsecase _balanceUsecase;
  final GetTransactionHistoryUsecase _historyUsecase;

  DashboardViewModel(this._balanceUsecase, this._historyUsecase, this._userUsecase);

  String? _username;

  @override
  String? get username => _username;

  @override
  Future<void> getAccountBalance() async {
    await _balanceUsecase.call();
    // _username = wallet.
  }

  @override
  Future<List<TransactionEntity>> getTransactionHistory() async {
    return await _historyUsecase.call();
  }

  @override
  Future<void> getUserProfile() async {
    final user = await _userUsecase.call();
    _username = user.username;
    notifyListeners();
  }
}
