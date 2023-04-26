import '../../menu/data/entities/user.dart';
import '../data/entities/rank.dart';

abstract class GameRepository {
  Future<void> updateUserRecord(int record);
  Future<List<User>> getLeaderboardList();
  Future<Rank> getUserRank(String uniqueId);
  void tapVibraion();
  void resultVibraion();
}
