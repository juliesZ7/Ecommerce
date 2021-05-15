import 'package:ecommerce/Model/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    Uri url = Uri.tryParse('https://cuongdshop.herokuapp.com/api/auth/login');
    final body = requestModel.toJson();
    // print('body: $body');
    final response = await http.post(url, body: body);
    // Map<String, String> headers;
    // final response = await http.get(url, headers: headers);
    // print('Headers: $headers');
    // print('${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(response.headers);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
