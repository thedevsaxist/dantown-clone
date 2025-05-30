import 'dart:convert';
import 'dart:io';

import 'package:dantown_clone/app/features/home/data/models/transaction_model.dart';
import 'package:dantown_clone/app/features/home/data/models/user_model.dart';
import 'package:dantown_clone/app/features/home/data/models/wallet_model.dart';

abstract class ITransactionsService {
  Future<List<TransactionModel>> getTransactionHistory();
  Future<UserModel> getUserProfile();
  Future<WalletModel> getAccountBalance();
}

class TransactionsService implements ITransactionsService {
  Future<String> openFile() async {
    return await File(
      "/Users/chidiebubeiroezindu/Developer/flutter_projects/it_application_projects/dantown_clone/lib/app/features/home/data/datasources/mock_data.json",
    ).readAsString();
  }

  @override
  Future<WalletModel> getAccountBalance() async {
    final data = await openFile();
    final response = WalletModel.fromJson(jsonDecode(data)["wallet"]);

    return response;
  }

  @override
  Future<List<TransactionModel>> getTransactionHistory() async {
    final data = await openFile();
    final List<dynamic> response = jsonDecode(data)["transactions"];
    final transactions = response.map((tran) => TransactionModel.fromJson(tran)).toList();

    return transactions;
  }

  @override
  Future<UserModel> getUserProfile() async {
    final data = await openFile();
    final response = UserModel.fromJson(jsonDecode(data)["user"]);

    return response;
  }
}
