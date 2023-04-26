import 'package:memory_game_app/features/game/data/entities/api_response.dart';
import 'package:memory_game_app/features/menu/data/entities/user.dart';
import 'package:unique_identifier/unique_identifier.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:vibration/vibration.dart';

import '../../../../config/api_contants.dart';
import '../../repository/game_repository.dart';
import '../entities/rank.dart';

class GameRepositoryImpl extends GameRepository {
  @override
  Future<ApiResponse> updateUserRecord(int record) async {
    String? uniqueMobileId = await UniqueIdentifier.serial;
    var url = Uri.parse(baseUrl + updateRecord);

    var newRecord = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'UniqueId': uniqueMobileId,
      'Record': '$record',
    });

    int rank = 0;

    if (newRecord.statusCode == 200) {
      rank = rankFromJson(newRecord.body).rank;
    }

    return ApiResponse(statusCode: newRecord.statusCode, response: rank);
  }

  @override
  Future<List<User>> getLeaderboardList() async {
    var url = Uri.parse(baseUrl + getLeaderboard);

    var leaderboard = await http.get(url, headers: {
      'Accept': 'application/json',
    });

    return leaderboardFromJson(leaderboard.body);
  }

  @override
  Future<Rank> getUserRank(String uniqueId) async {
    var url = Uri.parse(baseUrl + getRank);

    var rank = await http.post(url, body: {
      'UniqueId': uniqueId,
    }, headers: {
      'Accept': 'application/json',
    });

    return rankFromJson(rank.body);
  }

  @override
  void resultVibraion() {
    Vibration.vibrate(amplitude: 255, duration: 150);
    Vibration.vibrate(amplitude: 255, duration: 150);
  }

  @override
  void tapVibraion() {
    Vibration.vibrate(amplitude: 150, duration: 100);
  }
}
