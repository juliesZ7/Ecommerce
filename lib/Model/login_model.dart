import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginResponseModel {
  String token;
  LoginResponseModel({
    this.token,
  });
  factory LoginResponseModel.fromJson(Map<String, String> json) {
    return LoginResponseModel(
        token: json['x-auth-token'] != null
            ? json['x-auth-token']
            : 'X-Auth-Token == null');
  }
}

class LoginRequestModel {
  String email;
  String password;
  LoginRequestModel({this.email, this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {'email': email, 'password': password};
    return map;
  }
}
