import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/Tabs/homepage_tab.dart';
import 'package:ecommerce/Screen/Tabs/profile_tab.dart';
import 'package:ecommerce/Screen/Tabs/search_tab.dart';
import 'package:ecommerce/Screen/Tabs/setting_tab.dart';
import 'package:ecommerce/Screen/Widget/top_nav_ShowPageTab.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ProductInfoModel> cart = [];
  int bottomNavigationBarItemIndex;
  @override
  void initState() {
    super.initState();
    bottomNavigationBarItemIndex = 0;
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
      appBar: _topNav(),
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
      body: _switchPage(),
    );
  }

  _topNav() {
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
                                cart: cart, removeCartItemCB: removeCart)));
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

  _switchPage() {
    switch (bottomNavigationBarItemIndex) {
      case 0:
        return HomePageTab(
          cart: cart,
          addItemCartCB: addCart,
          removeItemCartCB: removeCart,
        );
      case 1:
        return SearchTab();
      case 2:
        return ProfileTab();
      default:
        return Center(
          child: Container(
            child: Text('Empty'),
          ),
        );
    }
  }
}
