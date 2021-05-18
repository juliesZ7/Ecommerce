import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/Tabs/homepage_tab.dart';
import 'package:ecommerce/Screen/Tabs/profile_tab.dart';
import 'package:ecommerce/Screen/Tabs/search_tab.dart';
import 'package:ecommerce/Screen/Tabs/setting_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Model/product_info.dart';

class ShowTabsPage extends StatefulWidget {
  final Function(int) removeItemCartCB;
  ShowTabsPage({this.removeItemCartCB});
  @override
  _ShowTabsPageState createState() => _ShowTabsPageState(
        removeItemCartCB: removeItemCartCB,
      );
}

class _ShowTabsPageState extends State<ShowTabsPage> {
  HomePageTab homePageTab = new HomePageTab();

  int bottomNavigationBarItemIndex;
  final Function(int) removeItemCartCB;
  _ShowTabsPageState({this.removeItemCartCB});
  final tabs = [HomePageTab(), SearchTab(), ProfileTab(), SettingTab()];

  @override
  void initState() {
    super.initState();
    bottomNavigationBarItemIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductInfoModel> cart = homePageTab.cart;
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
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartTab(
                                    cart: cart,
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
