import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class StorageService {
  Future<bool> generateUserId();

  Future<String?> getUserId();
}

class StorageServiceImpl implements StorageService {
  static const _userIdKey = 'user_id';
  static const uuid = Uuid();

  @override
  Future<bool> generateUserId() async {
    final value = uuid.v4();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_userIdKey, value);
  }

  @override
  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }
}
