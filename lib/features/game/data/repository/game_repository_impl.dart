import 'package:unique_identifier/unique_identifier.dart';
import 'package:http/http.dart' as http;

import '../../../../config/api_contants.dart';
import '../../repository/game_repository.dart';

class GameRepositoryImpl extends GameRepository {
  @override
  Future<void> updateUserRecord(int record) async {
    String? uniqueMobileId = await UniqueIdentifier.serial;
    var url = Uri.parse(baseUrl + updateRecord);

    print(uniqueMobileId);
    print(record);

    var p = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      'UniqueId': uniqueMobileId,
      'Record': '$record',
    });

    print(p.statusCode);
    print(p.body);
  }
}
