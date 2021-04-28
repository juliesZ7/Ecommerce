import 'package:ecommerce/Authentication_Service.dart';
import 'package:ecommerce/Screen/home_page.dart';
import 'package:ecommerce/Screen/login_screen.dart';
import 'package:ecommerce/product_info.dart';
import 'package:ecommerce/Screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'Screen/WelcomePage.dart';
import 'product_info.dart';
import 'Screen/product_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationServices>(
              create: (_) => AuthenticationServices(FirebaseAuth.instance)),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationServices>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: AuthenticationWrapper()));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return WelcomePage();
  }
}
