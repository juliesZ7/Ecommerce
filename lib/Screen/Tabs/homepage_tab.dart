import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/product_screen.dart';
import 'package:ecommerce/Screen/Tabs/show_tabs_page.dart';
import 'package:flutter/material.dart';

class HomePageTab extends StatefulWidget {
  List<ProductInfoModel> cart = [];
  final index;
  HomePageTab({this.index});
  @override
  _HomePageTabState createState() =>
      _HomePageTabState(index: index, cart: cart);
}

class _HomePageTabState extends State<HomePageTab> {
  final List<ProductInfoModel> cart;
  final index;
  int bottomNavigationBarItemIndex = 0;
  _HomePageTabState({this.index, this.cart});
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
    return SafeArea(
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
                              index: index,
                              cart: cart,
                              addItemCartCB: addCart,
                              removeItemCartCB: removeCart,
                            );
                          }));
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
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
    );
  }
}
