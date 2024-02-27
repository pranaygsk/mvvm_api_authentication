import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepository {
  final String apiUrl = "https://reqres.in/api";

  Future<String> loginUser(String email, String password) async {
    final String loginEndPoint = "$apiUrl/login";

    try {
      final response = await http.post(
        Uri.parse(loginEndPoint),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        return token;
      } else {
        throw Exception('Login failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
