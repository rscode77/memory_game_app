import '../data/entities/user.dart';

abstract class UserAuthRepository {
  Future<User?> authUser();
  Future<User?> addUser({required String name});
}
