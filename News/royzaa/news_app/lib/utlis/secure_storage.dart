import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late FlutterSecureStorage _storage;

  static void init() {
    _storage = const FlutterSecureStorage();
  }

  /// tag = name of the secret, secret = your token, credential, or anything else
  static Future<void> storeKey(String tag, String secret) async {
    await _storage.write(key: tag, value: secret);
  }

  // read secret by specify tag
  static Future<String?> readKey(String tag) async {
    return await _storage.read(key: tag);
  }
}
