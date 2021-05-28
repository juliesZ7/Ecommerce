import 'package:ecommerce/Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Service/Authentication_Service.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
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
                      'Register',
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Re-Password',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                TextFormField(
                  controller: rePasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6)
                      return 'Please enter your password';
                    // if (value != passwordController.text)
                    //   return 'Password does not match';
                    return null;
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Enter re-password',
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.grey[400])),
                ),
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
                              context.read<AuthenticationServices>().signUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            }
                          });
                        },
                        child: Text(
                          'Register',
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
