import 'package:ecommerce/Model/login_model.dart';
import 'package:ecommerce/Screen/new_home_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Authentication_Service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        fontFamily: 'Raleway',
                        // foreground: Paint()..shader =
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: emailController,
                  onSaved: (value) => loginRequestModel.email = value.trim(),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('gmail.com'))
                      return 'Please enter your email';
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter username',
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey[400])),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                TextFormField(
                  controller: passwordController,
                  onSaved: (value) => loginRequestModel.password = value.trim(),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6)
                      return 'Please enter your password';
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Enter password',
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey[400])),
                ),
                SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.blueAccent, Colors.greenAccent]),
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              print(loginRequestModel.toJson());
                            }
                          });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
