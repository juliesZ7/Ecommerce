import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/product_screen.dart';
import 'package:flutter/material.dart';

import '../new_cart_screen.dart';

class HomePageTab extends StatefulWidget {
  final index;
  HomePageTab({this.index});
  @override
  _HomePageTabState createState() => _HomePageTabState(index: index);
}

class _HomePageTabState extends State<HomePageTab> {
  List<ProductInfoModel> cart = [];
  final index;
  int bottomNavigationBarItemIndex = 0;
  _HomePageTabState({this.index});
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NewCartScreen(
                        cart: cart,
                        removeItemCartCB: removeCart,
                      );
                    }));
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
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Best Sale',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductScreen(
                                addItemCartCB: addCart,
                                cart: cart,
                                index: index,
                              );
                            }));
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 150,
                            height: 200,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Container(
                                    width: 100,
                                    child: Image(
                                        image: AssetImage(
                                            '${product[index].image}'))),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${product[index].name}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                    Text('${product[index].price}',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: product.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
