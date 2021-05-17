import 'package:ecommerce/Model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    Uri url = Uri.parse('https://cuongdshop.herokuapp.com/api/auth/login');
    final body = requestModel.toJson();
    final response = await http.post(
      url,
      body: body,
    );
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(response.headers);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
