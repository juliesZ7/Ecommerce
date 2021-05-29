import 'package:ecommerce/Bloc/block_state.dart';
import 'package:ecommerce/Bloc/product_bloc.dart';
import 'package:ecommerce/Model/API_Product_Model.dart';
import 'package:ecommerce/Repository/product/product_repository.dart';
import 'package:ecommerce/Screen/Pages/Cart_Page/Cart_Page.dart';
import 'package:ecommerce/Screen/Pages/HomePage/Home_Page.dart';
import 'package:ecommerce/Screen/Pages/Search_Page.dart';
import 'package:ecommerce/Screen/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainPage extends StatefulWidget {
  final Function logout;
  final bool isLogin;
  MainPage({this.isLogin = false, this.logout});
  @override
  _MainPageState createState() => _MainPageState(isLogin: isLogin);
}

class _MainPageState extends State<MainPage> {
  final bool isLogin;
  _MainPageState({this.isLogin, this.product});
  List<APIProductModel> cart = [];
  int bottomNavigationBarItemIndex;
  TextEditingController searchKey = new TextEditingController();
  ScrollController scrollControllerVer = new ScrollController();
  ScrollController scrollControllerHor = new ScrollController();
  final _productBloc = new ProductBloc();
  ProductRepository productRepository = new ProductRepository();
  List<APIProductModel> product = [];
  @override
  void initState() {
    super.initState();
    bottomNavigationBarItemIndex = 0;
    _productBloc.fetchAllData();
  }

  addCart(int index) {
    // setState(() {
    //   cart.add(product[index]);
    // });
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
    return StreamBuilder(
      stream: _productBloc.allData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          product = snapshot.data;
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blueAccent, Colors.greenAccent])),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        _logo(),
                                        _searchBar(),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        _userState(),
                                        _cart(),
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
                              product: product,
                              cart: cart,
                              removeItemCartCB: (int index) {
                                cart.remove(cart[index]);
                              },
                              addItemCartCB: (int index) {
                                cart.add(product[index]);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return StreamBuilder(
          stream: _productBloc.allDataState,
          builder: (context, state) {
            if (!state.hasData || state.data == BlocState.fetching) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        accentColor: Theme.of(context).textTheme.button.color,
                      ),
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              );
            }
            return SizedBox();
          },
        );
      },
    );
  }

  _logo() {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Stack(alignment: Alignment.center, children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: RadialGradient(center: Alignment.center, colors: [
                    Colors.white.withAlpha(100),
                    Colors.white.withAlpha(0)
                  ])),
            ),
            IconButton(
                splashRadius: 20,
                hoverColor: Colors.transparent,
                iconSize: 100,
                onPressed: () {},
                icon: Image(
                  image: AssetImage(
                      'assets/graphics/Mod_Yourself_Logo_Transparent.jpg'),
                )),
          ]),
        ),
      ),
    );
  }

  _searchBar() {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          // height: widthScreen * 0.025,
          // width: widthScreen * 0.3,
          height: 50,
          width: 500,
          child: TextFormField(
            textInputAction: TextInputAction.go,
            onFieldSubmitted: (summit) {
              print(summit);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                            cart: cart,
                            product: product,
                            removeItemCartCB: (int index) {
                              setState(() {
                                cart.remove(cart[index]);
                              });
                            },
                            addItemCartCB: (int index) {
                              setState(() {
                                cart.add(product[index]);
                              });
                            },
                            searchKeyFromMainPage: summit,
                          )));
            },
            controller: searchKey,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search anything!',
                hintStyle: TextStyle(color: Colors.blueAccent),
                contentPadding: EdgeInsets.all(20)),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                cart: cart,
                                product: product,
                                searchKeyFromMainPage: searchKey.text,
                              )));
                },
              ),
              alignment: Alignment.centerRight,
            ),
          ),
        )
      ],
    );
  }

  _cart() {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        maintainState: false, //Should?
                        builder: (context) => CartPage(
                            cart: cart, removeItemCartCB: removeCart)));
              });
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white, size: 30),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _changeCartColor()),
                width: 20,
                height: 20,
              ),
              Text(
                '${cart.length}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _userState() {
    return Container(
      height: 100,
      width: 250,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: _changeUserState(),
    );
  }

  _changeUserState() {
    if (isLogin) {
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
          DropdownButton(
            icon: Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: Colors.white,
            ),
            items: ['Your info', 'Log out'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) async {
              if (value == 'Your info')
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              if (value == 'Log out') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              }
            },
          )
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
