import 'package:ecommerce/Model/product_info.dart';
import 'package:flutter/material.dart';

class CartTab extends StatefulWidget {
  final List<ProductInfoModel> cart;
  final Function(int) removeCartItemCB;

  CartTab({this.cart, this.removeCartItemCB});
  @override
  _CartTabState createState() =>
      _CartTabState(cart: cart, removeCartItemCB: removeCartItemCB);
}

class _CartTabState extends State<CartTab> {
  final List<ProductInfoModel> cart;
  final Function(int) removeCartItemCB;

  _CartTabState({this.cart, this.removeCartItemCB});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Items: ${cart.length}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7), fontSize: 15),
              )
            ],
          ),
          elevation: 0,
          centerTitle: true,
          // backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(30),
            child: (cart.length != 0)
                ? Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 120,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Image(
                                          image: AssetImage(
                                              '${cart[index].image}'),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${cart[index].name}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                '${cart[index].price}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            return removeCartItemCB(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: cart.length),
                        ),
                      ),
                      Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.greenAccent
                                  ])),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  'Buy',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ))),
                    ],
                  )
                : Center(
                    child: Column(
                    children: [
                      Text('No Items'),
                    ],
                  )),
          ),
        ),
      ),
    );
  }
}
