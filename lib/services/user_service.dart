import '../constants/api_constants.dart';

class UserService {
  // Create - Tạo user mới
  static Future<bool> createUser(Map<String, dynamic> userData) async {
    try {
      final response = await ApiConstants.post('/users', data: userData);
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  // Read - Lấy danh sách users
  static Future<List<Map<String, dynamic>>?> getAllUsers() async {
    try {
      final response = await ApiConstants.get('/users');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.body as List<dynamic>;
        return data.cast<Map<String, dynamic>>();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Read - Lấy user theo ID
  static Future<Map<String, dynamic>?> getUserById(int userId) async {
    try {
      final response = await ApiConstants.get('/users/$userId');
      if (response.statusCode == 200) {
        return response.body as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Update - Cập nhật user
  static Future<bool> updateUser(int userId, Map<String, dynamic> userData) async {
    try {
      final response = await ApiConstants.put('/users/$userId', data: userData);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // Delete - Xóa user
  static Future<bool> deleteUser(int userId) async {
    try {
      final response = await ApiConstants.delete('/users/$userId');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
