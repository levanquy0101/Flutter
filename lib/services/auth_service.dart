import '../constants/api_constants.dart';

class AuthService {
  // Login API
  static Future<bool> login(String email, String password) async {
    try {
      final response = await ApiConstants.post('/login', data: {
        'email': email,
        'password': password,
      });

      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  // Logout API
  static Future<bool> logout() async {
    try {
      final response = await ApiConstants.post('/logout');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
