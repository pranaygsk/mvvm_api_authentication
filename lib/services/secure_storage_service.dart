import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService{
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<String?> readToken() async{
    return await _secureStorage.read(key: 'token');
  }

  Future<void> writeToken(String token) async{
    await _secureStorage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async{
    await _secureStorage.delete(key: 'token');
  }

}