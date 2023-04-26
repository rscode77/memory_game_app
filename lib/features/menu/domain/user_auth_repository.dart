import '../../game/data/entities/api_response.dart';
import '../data/entities/user.dart';

abstract class UserAuthRepository {
  Future<User?> authUser();
  Future<ApiResponse> addUser({required String name});
  void errorVibration();
}
