import 'package:api_task/services/api_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();

  //Loading Checking var
  bool _isLoading = false;

  //accessToken Store
  String? _accessToken;

  //getters
  bool get isLoading => _isLoading;
  String? get accessToken => _accessToken;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.login(email, password);
      if (response.success == true) {
        _accessToken = response.data?.accessToken;
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
