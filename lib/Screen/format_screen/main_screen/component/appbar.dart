import 'package:ecommerce/Api/Model/product_model.dart';
import 'package:ecommerce/Screen/old_screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/old_screen/Tabs/search_tab.dart';
import 'package:ecommerce/Screen/old_screen/WelcomePage.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  final List<ProductModel> cart;
  final bool userState;
  MainAppBar({
    this.cart,
    this.userState,
  });
  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Center(
        child: Container(
          width: 1360,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _logo(),
              _searchBar(),
              // SizedBox(
              //   width: 50,
              // ),
              //User State
              Container(
                height: 100,
                width: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: _changeUserState(),
              ),
              //Cart
              _cart(),
            ],
          ),
        ),
      ),
    );
  }

  _logo() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Stack(
            alignment: Alignment.center,
            children: [
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
            ],
          ),
        ),
      
    );
  }

  _searchBar() {
    final searchKey = TextEditingController();
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
                      builder: (context) => SearchTab(
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
                          builder: (context) => SearchTab(
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
                        builder: (context) => CartTab(
                              cart: widget.cart,
                              removeCartItemCB: (int index) {
                                // setState(() {
                                //   widget.cart.remove(widget.cart[index]);
                                // });
                              },
                            )));
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
                  color: widget.cart.isEmpty ? Colors.yellow : Colors.red,
                ),
                width: 20,
                height: 20,
              ),
              Text(
                '${widget.cart.length}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _changeUserState() {
    if (widget.userState) {
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
}
