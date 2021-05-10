// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// import 'product_info.dart';
// import 'dart:async';

// class UserInfo {
//   String role;
//   String _id;
//   String firstname;
//   String lastname;
//   String username;
//   String password;
//   String email;
//   String address;
//   int phone;
//   List<ProductInfoModel> cart;
//   String version;
//   UserInfo(
//       {this.role,
//       this.id,
//       this.firstname,
//       this.lastname,
//       this.username,
//       this.password,
//       this.email,
//       this.address,
//       this.phone,
//       this.cart,
//       this.version});
//   factory UserInfo.fromJson(Map<String, dynamic> json) {
//     return UserInfo(
//       role: json['role'],
//       id: json['_id'],
//       firstname: json['firstname'],
//       lastname: json['lastname'],
//       username: json['username'],
//       password: json['password'],
//       email: json['email'],
//       address: json['address'],
//       phone: json['phone'],
//       cart: json['cart'],
//       version: json['version'],
//     );
//   }
// }

// UserInfo getUser;
// StreamController streamController = new StreamController();
// Sink get getSink => streamController.sink;
// Stream get getStream => streamController.stream;
// Future<UserInfo> fetchUser() async {
//   final url = Uri.tryParse('https://cuong-do.herokuapp.com/api/user/signin');
//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     var jsonResponse = jsonDecode(response.body);
//   //   getUser
//   //   getSink.add(jsonResponse);
//   // }
// }
