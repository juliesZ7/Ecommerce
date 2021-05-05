import 'package:ecommerce/Screen/login_screen.dart';
import 'package:ecommerce/Screen/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image(
                    image: AssetImage(
                        'assets/graphics/Mod_Yourself_Logo_Transparent.jpg')),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blueAccent, Colors.greenAccent]),
                ),
                child: TextButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blueAccent, Colors.greenAccent]),
                ),
                child: TextButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
