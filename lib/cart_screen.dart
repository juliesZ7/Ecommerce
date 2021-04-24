import 'package:ecommerce/product_info.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/cart';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProductInfo productInfo = ProductInfo();
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
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Image.asset('assets\graphics\samsung-galaxy-note-9.jpg'),
                Column(
                  children: [
                    Text(productInfo.name),
                    Text(
                      productInfo.price.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
