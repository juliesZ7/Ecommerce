import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/Tabs/profile_tab.dart';
import 'package:ecommerce/Screen/Tabs/search_tab.dart';
import 'package:flutter/material.dart';

import 'new_home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ProductInfoModel> cart = [];
  int bottomNavigationBarItemIndex;
  TextEditingController searchKey = new TextEditingController();
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
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blueAccent, Colors.greenAccent])),
            height: heightScreen * 0.15,
            child: Stack(
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image(
                            image: AssetImage(
                                'assets/graphics/Mod_Yourself_Logo_Transparent.jpg'),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(50),
                              ),
                              BoxShadow(
                                  color: Colors.blue.withAlpha(0),
                                  spreadRadius: -5,
                                  blurRadius: 5)
                            ],
                            // color: Colors.white.withAlpha(125),
                            borderRadius: BorderRadius.circular(30)),
                        height: heightScreen * 0.07,
                        width: widthScreen * 0.3,
                        child: TextFormField(
                          controller: searchKey,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search anything!',
                              hintStyle: TextStyle(color: Colors.white),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 0, 20, 0)),
                        ),
                      ),
                      SizedBox(
                        width: widthScreen * 0.009,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              Text('Signin/Signup',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
//   _topNav() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       title: Text(
//         'Home Page',
//         style: TextStyle(color: Colors.blueAccent),
//       ),
//       elevation: 0,
//       centerTitle: true,
//       actions: [
//         Row(
//           children: [
//             Text(
//               '${cart.length}',
//               style: TextStyle(
//                   color: Colors.blueAccent,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700),
//             ),
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => CartTab(
//                                 cart: cart, removeCartItemCB: removeCart)));
//                   });
//                 },
//                 icon: Icon(
//                   Icons.shopping_cart,
//                   color: Colors.blueAccent,
//                 ))
//           ],
//         ),
//       ],
//     );
//   }

//   _switchPage() {
//     switch (bottomNavigationBarItemIndex) {
//       case 0:
//         return HomePageTab(
//           cart: cart,
//           addItemCartCB: addCart,
//           removeItemCartCB: removeCart,
//         );
//       case 1:
//         return SearchTab();
//       case 2:
//         return ProfileTab();
//       default:
//         return Center(
//           child: Container(
//             child: Text('Empty'),
//           ),
//         );
//     }
//   }
// }

// appBar: _topNav(),
// bottomNavigationBar: BottomNavigationBar(
// currentIndex: bottomNavigationBarItemIndex,
// unselectedItemColor: Colors.grey[500],
// backgroundColor: Colors.white,
// type: BottomNavigationBarType.fixed,
// elevation: 100,
// items: [
//   BottomNavigationBarItem(
//       icon: Icon(
//         Icons.home,
//         color: (bottomNavigationBarItemIndex == 0)
//             ? Colors.lightBlueAccent
//             : Colors.grey[500],
//       ),
//       label: 'Home'),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.search,
//         color: (bottomNavigationBarItemIndex == 1)
//             ? Colors.lightBlueAccent
//             : Colors.grey[500]),
//     label: 'Search',
//   ),
//   BottomNavigationBarItem(
//       icon: Icon(Icons.person_outline_rounded,
//           color: (bottomNavigationBarItemIndex == 2)
//               ? Colors.lightBlueAccent
//               : Colors.grey[500]),
//       label: 'Person'),
//   BottomNavigationBarItem(
//     icon: Icon(Icons.settings,
//         color: (bottomNavigationBarItemIndex == 3)
//             ? Colors.lightBlueAccent
//             : Colors.grey[500]),
//     label: 'Setting',
//   )
// ],
// onTap: (value) {
//   setState(() {
//     bottomNavigationBarItemIndex = value;
//   });
// }),
