import 'package:memory_game_app/features/menu/data/entities/user.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../../../../config/api_contants.dart';
import '../../domain/user_auth_repository.dart';
import 'package:http/http.dart' as http;

class UserAuthRepositoryImpl extends UserAuthRepository {
  @override
  Future<User?> authUser() async {
    String? uniqueMobileId = await UniqueIdentifier.serial;
    var url = Uri.parse(baseUrl + verifyUser);

    var response = await http.post(url, body: {
      'UniqueId': uniqueMobileId,
    });

    if (response.statusCode == 200) {
      User userData = User.fromJson(response.body);
      return User(
        uniqueId: userData.uniqueId,
        id: userData.id,
        name: userData.name,
        record: userData.record,
      );
    } else {
      return null;
    }
  }

  @override
  Future<User?> addUser({required String name}) async {
    String? uniqueMobileId = await UniqueIdentifier.serial;
    var url = Uri.parse(baseUrl + addNewUser);

    var response = await http.post(url, body: {
      'UniqueId': uniqueMobileId,
      'Name': name,
    });

    if (response.statusCode == 200) {
      authUser();
    }

    return null;
  }
}
