class LoginResponseModel {
  String token;
  LoginResponseModel({
    this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, String> json) {
    return LoginResponseModel(token: json['x-auth-token'] ?? '');
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
