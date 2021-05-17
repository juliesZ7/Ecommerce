import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/Tabs/homepage_tab.dart';
import 'package:ecommerce/Screen/Tabs/search_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Model/product_info.dart';

class ShowTabsPage extends StatefulWidget {
  List<ProductInfoModel> cart = [];
  int index = 0;
  @override
  _ShowTabsPageState createState() => _ShowTabsPageState();
}

class _ShowTabsPageState extends State<ShowTabsPage> {
  List<ProductInfoModel> cart = [];
  int bottomNavigationBarItemIndex;
  final index;
  _ShowTabsPageState({this.cart, this.index});
  var tabs = [];
  @override
  void initState() {
    super.initState();
    bottomNavigationBarItemIndex = 0;
    final tabs = [
      HomePageTab(
        cart: cart,
        index: index,
      ),
      SearchTab(),
    ];
  }

  addCart(int index) {
    setState(() {
      cart.add(product[index]);
    });
  }

  removeCart(int index) {
    setState(() {
      cart.remove(cart[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartTab(
                                  index: index,
                                  cart: cart,
                                  addItemCartCB: addCart(index),
                                  removeItemCartCB: removeCart(index),
                                )));
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.blueAccent,
                  ))
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavigationBarItemIndex,
          unselectedItemColor: Colors.grey[500],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 100,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: (bottomNavigationBarItemIndex == 0)
                      ? Colors.lightBlueAccent
                      : Colors.grey[500],
                ),
                label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: (bottomNavigationBarItemIndex == 1)
                      ? Colors.lightBlueAccent
                      : Colors.grey[500]),
              label: 'Search',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded,
                    color: (bottomNavigationBarItemIndex == 2)
                        ? Colors.lightBlueAccent
                        : Colors.grey[500]),
                label: 'Person'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: (bottomNavigationBarItemIndex == 3)
                      ? Colors.lightBlueAccent
                      : Colors.grey[500]),
              label: 'Setting',
            )
          ],
          onTap: (value) {
            setState(() {
              bottomNavigationBarItemIndex = value;
            });
          }),
      body: tabs[bottomNavigationBarItemIndex],
    );
  }
}