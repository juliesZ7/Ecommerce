import 'package:ecommerce/Model/login_model.dart';
import 'package:ecommerce/Screen/Tabs/AppBar_Page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Authentication_Service.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/Service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel = new LoginRequestModel();
  LoginResponseModel loginResponseModel = new LoginResponseModel();
  final api = APIService();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

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
                  onSaved: (value) {
                    loginRequestModel.email = value.trim();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty || !value.contains('@'))
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
                  onSaved: (value) {
                    loginRequestModel.password = value.trim();
                  },
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
                          setState(() async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print('${loginRequestModel.email}');
                              print('${loginRequestModel.password}');
                              loginRequestModel.toJson();
                              APIService apiService = new APIService();
                              final data =
                                  await apiService.login(loginRequestModel);
                              final SharedPreferences sharedPreferences =
                                  await prefs;
                              sharedPreferences.setString(
                                  'x-auth-token', data.token);
                              final String token =
                                  sharedPreferences.getString('x-auth-token');
                              print(
                                  'Token = ${sharedPreferences.getString('x-auth-token')}');
                              if (token != 'non-token') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage(token: token)));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                          content: Container(
                                            height: 300,
                                            width: 500,
                                            child: Text(
                                                'Username or password is not correct'),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            )
                                          ],
                                        ),
                                    barrierDismissible: false);
                              }
                            }
                          });
                        },
                        child: Text(
                          loginResponseModel.token == null
                              ? 'Login'
                              : loginResponseModel.token,
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
