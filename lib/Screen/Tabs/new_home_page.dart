import 'package:ecommerce/Model/product_info.dart';
import 'package:flutter/material.dart';

class HomePageTab extends StatefulWidget {
  final List<ProductInfoModel> cart;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  HomePageTab({this.cart, this.addItemCartCB, this.removeItemCartCB});
  @override
  _HomePageTabState createState() => _HomePageTabState(
      cart: cart,
      addItemCartCB: addItemCartCB,
      removeItemCartCB: removeItemCartCB);
}

class _HomePageTabState extends State<HomePageTab> {
  final List<ProductInfoModel> cart;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  int bottomNavigationBarItemIndex = 0;
  _HomePageTabState({this.cart, this.addItemCartCB, this.removeItemCartCB});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
