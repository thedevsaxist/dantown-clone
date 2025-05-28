import 'package:dantown_clone/app/features/home/domain/entities/user_entity.dart';
import 'package:dantown_clone/app/features/home/domain/repo/transaction_service_repo.dart';

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
