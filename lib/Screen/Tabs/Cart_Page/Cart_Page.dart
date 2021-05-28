import 'package:ecommerce/Model/product_info.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<ProductInfoModel> cart;
  final Function(int) removeCartItemCB;

  CartPage({this.cart, this.removeCartItemCB});
  @override
  _CartPageState createState() =>
      _CartPageState(cart: cart, removeItemCartCB: removeCartItemCB);
}

class _CartPageState extends State<CartPage> {
  final List<ProductInfoModel> cart;
  final Function(int) removeItemCartCB;

  _CartPageState({this.cart, this.removeItemCartCB});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 1360,
            color: Colors.white,
            padding: const EdgeInsets.all(30),
            child: (cart.length != 0)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Column(
                        children: [
                          Text(
                            'Your Cart',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Text(
                            'Items: ${cart.length}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 15),
                          )
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 1000,
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
                                            return removeItemCartCB(index);
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
                : Column(
                    children: [
                      Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Center(
                          child: Column(
                        children: [
                          Text('No Items'),
                        ],
                      )),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
