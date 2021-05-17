import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'product_info.dart';
import 'dart:async';

class UserInfoModel {
  String role;
  String id;
  String firstname;
  String lastname;
  String username;
  String password;
  String email;
  String address;
  int phone;
  List<ProductInfoModel> cart;
  String version;
  UserInfoModel(
      {this.role,
      this.id,
      this.firstname,
      this.lastname,
      this.username,
      this.password,
      this.email,
      this.address,
      this.phone,
      this.cart,
      this.version});
  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      role: json['role'],
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      cart: json['cart'],
      version: json['version'],
    );
  }
}

class UserBloc {
  UserInfoModel getUser;
  StreamController<UserInfoModel> streamController =
      new StreamController<UserInfoModel>();
  // Sink get getSink => streamController.sink;
  Stream<UserInfoModel> get getStream => streamController.stream;
  Future<UserInfoModel> fetchUser() async {
    final url = Uri.tryParse('https://cuongdshop.herokuapp.com/api/product');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // getSink.add(jsonResponse);
      getUser = UserInfoModel.fromJson(jsonResponse);
      streamController.sink.add(getUser);
    }
    return Future.value(getUser);
  }

  dispose() {
    streamController.close();
  }
}
