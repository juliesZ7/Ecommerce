import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Your Cart',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Item: 3',
              style:
                  TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 10),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
