import 'dart:html';
import 'dart:io';
import 'package:ecommerce/Model/login_model.dart';
import 'package:ecommerce/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    // final SharedPreferences sharedPreferences =
    //                             await prefs;

    //                         final String token =
    //                             sharedPreferences.getString('x-auth-token'); send request in header: {'token': <token>}
    Uri url = Uri.tryParse('https://cuongdshop.herokuapp.com/api/user/login');
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
