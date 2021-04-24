import 'package:ecommerce/LoginScreen.dart';
import 'package:ecommerce/ProductInfo.dart';
import 'package:ecommerce/cart_screen.dart';
import 'package:flutter/material.dart';
import 'WelcomePage.dart';
import 'ProductInfo.dart';
import 'ProductScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CartScreen(),
  ));
}
