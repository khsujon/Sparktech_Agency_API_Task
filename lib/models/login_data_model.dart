class LoginDataModel {
  bool? success;
  String? message;
  Data? data;

  LoginDataModel({this.success, this.message, this.data});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;
  String? role;
  String? sId;
  String? status;

  Data({this.accessToken, this.refreshToken, this.role, this.sId, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    role = json['role'];
    sId = json['_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['role'] = role;
    data['_id'] = sId;
    data['status'] = status;
    return data;
  }
}
