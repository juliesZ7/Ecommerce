import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/Tabs/search_tab.dart';
import 'package:ecommerce/Screen/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Screen/Tabs/HomePage/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ProductInfoModel> cart = [];
  int bottomNavigationBarItemIndex;
  TextEditingController searchKey = new TextEditingController();
  bool userState;
  ScrollController scrollControllerVer = new ScrollController();
  ScrollController scrollControllerHor = new ScrollController();
  @override
  void initState() {
    super.initState();
    bottomNavigationBarItemIndex = 0;
    userState = false;
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
                                              textInputAction:
                                                  TextInputAction.go,
                                              onFieldSubmitted: (summit) {
                                                print(summit);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SearchTab(
                                                              searchKeyFromMainPage:
                                                                  summit,
                                                            )));
                                              },
                                              controller: searchKey,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Search anything!',
                                                  hintStyle: TextStyle(
                                                      color: Colors.blueAccent),
                                                  contentPadding:
                                                      EdgeInsets.all(20)),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Align(
                                                child: IconButton(
                                                  icon: Icon(Icons.search),
                                                  color: Colors.blueAccent,
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    SearchTab(
                                                                      searchKeyFromMainPage:
                                                                          searchKey
                                                                              .text,
                                                                    )));
                                                  },
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),

                                      //User State
                                      Container(
                                        height: 100,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100)),
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
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CartTab(
                                                                cart: cart,
                                                                removeCartItemCB:
                                                                    removeCart,
                                                              )));
                                                });
                                              },
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
                                                      color: Colors.black,
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
                        width: widthScreen,
                        child: Center(
                          child: HomePageTab(
                            cart: cart,
                            removeItemCartCB: removeCart,
                            addItemCartCB: addCart,
                          ),
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
    if (userState) {
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
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomePage()));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
          Text('Signin/Signup', style: TextStyle(color: Colors.white)),
        ],
      ),
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
