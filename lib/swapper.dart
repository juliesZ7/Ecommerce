import 'package:ecommerce/Screen/format_screen/main_screen/main_screen.dart';
import 'package:ecommerce/Screen/old_screen/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Swapper extends StatelessWidget {
  final User firebaseUser;
  Swapper({this.firebaseUser});
  @override
  Widget build(BuildContext context) {
    if (firebaseUser != null) {
      return MainScreen();
    }
    return WelcomePage();
  }
}
