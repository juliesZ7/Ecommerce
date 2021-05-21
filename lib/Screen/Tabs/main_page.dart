import 'package:ecommerce/Model/product_info.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Screen/Tabs/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ProductInfoModel> cart = [];
  int bottomNavigationBarItemIndex;
  TextEditingController searchKey = new TextEditingController();
  bool userState = true;
  ScrollController scrollControllerVer = new ScrollController();
  ScrollController scrollControllerHor = new ScrollController();
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
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.greenAccent])),
        child: Align(
          alignment: Alignment.topCenter,
          child: Form(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      //AppBar
                      Container(
                          height: 150,
                          child: Center(
                            child: Container(
                              // width: widthScreen * 0.7,
                              width: 1360,
                              child: Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Logo
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 50),
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: 70,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        gradient: RadialGradient(
                                                            center: Alignment
                                                                .center,
                                                            colors: [
                                                              Colors.white
                                                                  .withAlpha(
                                                                      100),
                                                              Colors.white
                                                                  .withAlpha(0)
                                                            ])),
                                                  ),
                                                  IconButton(
                                                      splashRadius: 20,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      iconSize: 100,
                                                      onPressed: () {},
                                                      icon: Image(
                                                        image: AssetImage(
                                                            'assets/graphics/Mod_Yourself_Logo_Transparent.jpg'),
                                                      )),
                                                ]),
                                          ),
                                        ),
                                      ),

                                      //Search bar
                                      Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            // height: widthScreen * 0.025,
                                            // width: widthScreen * 0.3,
                                            height: 50,
                                            width: 500,
                                            child: TextFormField(
                                              controller: searchKey,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Search anything!',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black),
                                                  contentPadding:
                                                      EdgeInsets.all(20)),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Align(
                                                child: Icon(
                                                  Icons.search,
                                                  color: Colors.blueAccent,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        // width: widthScreen * 0.03,
                                        width: 50,
                                      ),

                                      //User State
                                      Container(
                                        // height: heightScreen * 0.1,
                                        // width: widthScreen * 0.12,
                                        height: 100,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        // child: _changeUserState(
                                        //     heightScreen, widthScreen)),
                                        child: _changeUserState(),
                                      ),

                                      //Cart
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 50),
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.shopping_cart,
                                                  color: Colors.white,
                                                  size: 30),
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color:
                                                          _changeCartColor()),
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                Text(
                                                  '${cart.length}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),

                      //Real body
                      Container(
                        height: heightScreen,
                        width: 1360,
                        color: Colors.red,
                        child: HomePageTab(
                          cart: cart,
                          removeItemCartCB: removeCart,
                          addItemCartCB: addCart,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _changeUserState() {
    if (userState == true) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/graphics/user_ava.jpg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  'Huyền Miêu',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {})
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person,
          color: Colors.white,
          size: 30,
        ),
        Text('Signin/Signup', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  _changeCartColor() {
    if (cart.length != 0) {
      setState(() {
        return Colors.red;
      });
    }
    return Colors.yellow;
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
