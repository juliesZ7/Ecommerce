import 'package:ecommerce/Screen/Tabs/homepage_tab.dart';
import 'package:ecommerce/Screen/Tabs/search_tab.dart';
import 'package:ecommerce/Screen/cart_screen.dart';
import 'package:ecommerce/Screen/new_cart_screen.dart';
import 'package:ecommerce/Screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Model/product_info.dart';
// import 'package:ecommerce/get_api.dart';

// class ShowTabsPage extends StatefulWidget {
//   @override
//   _ShowTabsPageState createState() => _ShowTabsPageState();
// }

// class _ShowTabsPageState extends State<ShowTabsPage> {
//   HomePageTab homePageTab = new HomePageTab();
//   SearchTab searchTab = new SearchTab();
//   var tabs = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final bottomNavigationBarItemIndex = 0;
//     tabs = [
//       homePageTab.createState().build(context),
//       searchTab.createState().build(context)
//     ];
//   }

class ShowTabsPage extends StatefulWidget {
  @override
  _ShowTabsPageState createState() => _ShowTabsPageState();
}

class _ShowTabsPageState extends State<ShowTabsPage> {
  HomePageTab homePageTab = new HomePageTab();
  SearchTab searchTab = new SearchTab();
  final tabs = [
    HomePageTab(),
    SearchTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return tabs[0];
  }
}
