import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}


class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage storage;

  SecureStorageServiceImpl(this.storage);

  static const _tokenKey = "access_token";

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await storage.delete(key: _tokenKey);
  }
}