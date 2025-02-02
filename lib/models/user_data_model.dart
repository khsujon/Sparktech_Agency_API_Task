class UserDataModel {
  bool? success;
  String? message;
  Data? data;

  UserDataModel({this.success, this.message, this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? contact;
  String? profilePicture;
  String? role;
  String? status;

  Data({
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.contact,
    this.profilePicture,
    this.role,
    this.status,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    contact = json['contact'];
    profilePicture = json['profilePicture'];
    role = json['role'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['contact'] = contact;
    data['profilePicture'] = profilePicture;
    data['role'] = role;
    data['status'] = status;
    return data;
  }
}
