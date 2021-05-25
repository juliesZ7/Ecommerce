import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/Tabs/HomePage/home_page.dart';
import 'package:ecommerce/Screen/Widget/top_nav_ShowPageTab.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Model/product_info.dart';
import '../Model/product_info.dart';
import 'Widget/top_nav_ShowPageTab.dart';

class ProductScreen extends StatefulWidget {
  final List<ProductInfoModel> cart;
  final index;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  ProductScreen(
      {this.index, this.cart, this.addItemCartCB, this.removeItemCartCB});
  @override
  _ProductScreenState createState() => _ProductScreenState(
      index: index,
      addItemCartCB: addItemCartCB,
      removeItemCartCB: removeItemCartCB,
      cart: cart);
}

class _ProductScreenState extends State<ProductScreen> {
  final List<ProductInfoModel> cart;
  final index;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  _ProductScreenState(
      {this.index, this.cart, this.addItemCartCB, this.removeItemCartCB});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartTab(
                                    cart: cart,
                                    removeCartItemCB: removeItemCartCB,
                                  )));
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.blueAccent,
                  ))
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            color: Colors.grey[100],
            width: 1360,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 500,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('${product[index].image}'),
                        width: 400,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        width: 816,
                        height: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${product[index].name}',
                              style: TextStyle(fontSize: 30),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                '${product[index].price}',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(color: Colors.orange),
                                child: TextButton(
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      return addItemCartCB(index);
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: 1360,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            'Chi tiết sản phẩm',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 20, bottom: 20),
                          child: Text('${product[index].description}'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // body: Container(
      //   color: Colors.white,
      //   padding: EdgeInsets.all(30),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Expanded(
      //         child: SizedBox(
      //           child: ListView(
      //             children: [
      //               Center(
      //                 child: Container(
      //                     height: MediaQuery.of(context).size.height * 0.3,
      //                     child: Image.asset('${product[index].image}')),
      //               ),
      //               SizedBox(
      //                 height: 50,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 10),
      //                 child: Text(
      //                   '${product[index].name}',
      //                   style: TextStyle(
      //                       fontSize: 25, fontWeight: FontWeight.bold),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 10),
      //                 child: Text(
      //                   '${product[index].price}',
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 30,
      //                       color: Colors.redAccent),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.all(10),
      //                 child: Text(
      //                   '${product[index].description}',
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Center(
      //         child: Container(
      //             height: 50,
      //             width: 300,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(50),
      //                 gradient: LinearGradient(
      //                     begin: Alignment.centerLeft,
      //                     end: Alignment.centerRight,
      //                     colors: [Colors.blueAccent, Colors.greenAccent])),
      //             child: TextButton(
      //                 style: ButtonStyle(),
      //                 onPressed: () {
      //                   setState(() {
      //                     return addItemCartCB(index);
      //                   });
      //                 },
      //                 child: Text(
      //                   'Add to cart',
      //                   style: TextStyle(color: Colors.white, fontSize: 20),
      //                 ))),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
