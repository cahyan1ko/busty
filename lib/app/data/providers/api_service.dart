import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const baseUrl = 'http://127.0.0.1:5000/api';

  static Future<UserModel> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    print("test");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      return UserModel.error(data['message'] ?? 'Username atau password salah');
    }
  }

  //
  static Future<Map<String, dynamic>> register(
      String username, String email, String noHp, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'no_hp': noHp,
        'password': password,
      }),
    );

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode == 201 && data['status'] == 'success') {
      return {'status': 'success', 'message': data['message']};
    } else {
      return {
        'status': 'error',
        'message': data['message'] ?? 'Registrasi gagal'
      };
    }
  }
}
