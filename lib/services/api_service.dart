import 'dart:convert';

import 'package:api_task/models/login_data_model.dart';
import 'package:api_task/models/user_data_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //base Url og api
  static const String baseUrl = "https://api.pentagoncare.online/api/v1";

  //login function
  Future<LoginDataModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/sign-in'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return LoginDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  //User details fetch function
  Future<UserDataModel> getUserDetails(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user details');
    }
  }
}
