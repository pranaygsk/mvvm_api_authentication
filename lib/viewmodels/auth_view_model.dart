import 'package:flutter/cupertino.dart';
import 'package:mvvm_api_authentication/data/auth_repository.dart';
import 'package:mvvm_api_authentication/services/secure_storage_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  final SecureStorageService _secureStorage = SecureStorageService();

  String _token = '';

  String get token => _token;

  AuthViewModel() {
    _getTokenFromStorage();
  }

  Future<void> loginUser(String email, String password) async {
    try {
      _token = await _authRepository.loginUser(email, password);
      notifyListeners();
    } catch (e) {
      print("Error $e");
    }
  }

  Future<void> _getTokenFromStorage() async {
    _token = await _secureStorage.readToken() ?? '';
    notifyListeners();
  }
}
