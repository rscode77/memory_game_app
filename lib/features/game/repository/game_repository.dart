import '../../menu/data/entities/user.dart';
import '../data/entities/rank.dart';

abstract class GameRepository {
  Future<void> updateUserRecord(int record, int taps);
  Future<List<User>> getTimeLeaderboard();
  Future<List<User>> getTapLeaderboard();
  Future<Rank> getUserRank(String uniqueId);
  void tapVibraion();
  void resultVibraion();
}
