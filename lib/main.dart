import 'package:ecommerce/Screen/Pages/AppBar_Page.dart';
import 'package:ecommerce/Service/Authentication_Service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future<SharedPreferences> prefs = SharedPreferences.getInstance();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationServices>(
          create: (_) => AuthenticationServices(FirebaseAuth.instance)),
      StreamProvider(
        create: (context) =>
            context.read<AuthenticationServices>().authStateChanges,
        initialData: null,
      ),
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MainPage();
    }
    return WelcomePage();
  }
}
