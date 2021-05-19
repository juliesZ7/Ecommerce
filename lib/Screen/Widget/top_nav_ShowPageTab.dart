import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:flutter/material.dart';

class TopNav extends StatefulWidget {
  final List<ProductInfoModel> cart;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  TopNav({this.cart, this.addItemCartCB, this.removeItemCartCB});
  @override
  _TopNavState createState() => _TopNavState(
      cart: cart,
      addItemCartCB: addItemCartCB,
      removeItemCartCB: removeItemCartCB);
}

class _TopNavState extends State<TopNav> {
  final List<ProductInfoModel> cart;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  _TopNavState({this.cart, this.addItemCartCB, this.removeItemCartCB});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Home Page',
        style: TextStyle(color: Colors.blueAccent),
      ),
      elevation: 0,
      centerTitle: true,
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
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartTab(
                                  cart: cart,
                                  removeCartItemCB: removeItemCartCB,
                                )));
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.blueAccent,
                ))
          ],
        ),
      ],
    );
  }
}
