import 'package:ecommerce/Screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/product_info.dart';

class ProductScreen extends StatefulWidget {
  final List<ProductInfoModel> cart;
  final index;
  final Function(int) callBack;
  ProductScreen({this.index, this.cart, this.callBack});
  @override
  _ProductScreenState createState() =>
      _ProductScreenState(index: index, cart: cart, callBack: callBack);
}

class _ProductScreenState extends State<ProductScreen> {
  final List<ProductInfoModel> cart;
  final index;
  final Function(int) callBack;
  _ProductScreenState({this.index, this.cart, this.callBack});
  @override
  Widget build(BuildContext context) {
    print("productScreen: $cart");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              Text(
                '${cart.length}',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      print("homePageScreen 1: $cart");
                      return CartScreen(cart: cart);
                    }));
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.blueAccent,
                  ))
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: [
                    Center(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset('${product[index].image}')),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${product[index].name}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${product[index].price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.redAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${product[index].description}',
                      ),
                    ),
                  ],
                ),
              ),
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
                          colors: [Colors.blueAccent, Colors.greenAccent])),
                  child: TextButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        setState(() {
                          callBack(index);
                        });
                      },
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
