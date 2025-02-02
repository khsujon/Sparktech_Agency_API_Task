import 'package:api_task/models/user_data_model.dart';
import 'package:api_task/services/api_service.dart';
import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();

  //Loading Checking var
  bool _isLoading = false;

  //user data store
  UserDataModel? _userDetails;

  //getters
  bool get isLoading => _isLoading;
  UserDataModel? get userDetails => _userDetails;

  Future<void> fetchUserDetails(String accessToken) async {
    _isLoading = true;
    notifyListeners();

    try {
      _userDetails = await _apiService.getUserDetails(accessToken);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
