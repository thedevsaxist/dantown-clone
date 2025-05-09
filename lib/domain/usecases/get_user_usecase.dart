import 'package:d_crypto_lite/domain/entities/user_entity.dart';
import 'package:d_crypto_lite/domain/repo/transaction_service_repo.dart';

class GetUserUsecase {
  final TransactionServiceRepo _transactionServiceRepo;

  const GetUserUsecase(this._transactionServiceRepo);

  Future<UserEntity> call() async {
    try {
      final user = await _transactionServiceRepo.getUserProfile();
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
