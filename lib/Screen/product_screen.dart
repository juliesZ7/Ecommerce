import 'package:ecommerce/Screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:ecommerce/Screen/cart_screen.dart';
import 'package:ecommerce/Screen/new_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Model/product_info.dart';
import '../Model/product_info.dart';

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
      cart: cart,
      addItemCartCB: addItemCartCB,
      removeItemCartCB: removeItemCartCB);
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
      backgroundColor: Colors.white,
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
                                  removeItemCartCB: removeItemCartCB)));
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: [
                    Center(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset('${product[index].image}')),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${product[index].name}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${product[index].price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.redAccent),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${product[index].description}',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.blueAccent, Colors.greenAccent])),
                  child: TextButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        setState(() {
                          addItemCartCB(index);
                        });
                      },
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  // createDialog(BuildContext context) {
  //   return showGeneralDialog(
  //       barrierDismissible: true,
  //       barrierLabel: 'Cart',
  //       context: context,
  //       pageBuilder: (BuildContext buildContext, Animation animation,
  //           Animation secondaryAnimation) {
  //         return Column(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(50), color: Colors.red),
  //               height: MediaQuery.of(context).size.height * 0.9,
  //               width: MediaQuery.of(context).size.width,
  //               child: Scaffold(
  //                 appBar: AppBar(
  //                   title: Column(
  //                     children: [
  //                       Text(
  //                         'Your Cart',
  //                         style: TextStyle(color: Colors.black),
  //                       ),
  //                       Text(
  //                         'Items: ${cart.length}',
  //                         style: TextStyle(
  //                             color: Colors.black.withOpacity(0.7),
  //                             fontSize: 15),
  //                       )
  //                     ],
  //                   ),
  //                   elevation: 0,
  //                   centerTitle: true,
  //                   backgroundColor: Colors.white,
  //                 ),
  //                 body: SafeArea(
  //                   child: Container(
  //                     color: Colors.white,
  //                     padding: const EdgeInsets.all(30),
  //                     child: (cart.length != 0)
  //                         ? Column(
  //                             children: [
  //                               Expanded(
  //                                 child: SizedBox(
  //                                   child: ListView.separated(
  //                                       itemBuilder: (context, index) {
  //                                         return Container(
  //                                           height: 120,
  //                                           child: Row(
  //                                             children: [
  //                                               Container(
  //                                                 height: 50,
  //                                                 child: Image(
  //                                                   image: AssetImage(
  //                                                       '${cart[index].image}'),
  //                                                 ),
  //                                               ),
  //                                               Expanded(
  //                                                 child: Container(
  //                                                   padding: EdgeInsets.only(
  //                                                       left: 20),
  //                                                   child: Column(
  //                                                     crossAxisAlignment:
  //                                                         CrossAxisAlignment
  //                                                             .start,
  //                                                     mainAxisAlignment:
  //                                                         MainAxisAlignment
  //                                                             .center,
  //                                                     children: [
  //                                                       Text(
  //                                                         '${cart[index].name}',
  //                                                         style: TextStyle(
  //                                                             color:
  //                                                                 Colors.black,
  //                                                             fontSize: 18),
  //                                                       ),
  //                                                       Text(
  //                                                         '${cart[index].price}',
  //                                                         style: TextStyle(
  //                                                             color:
  //                                                                 Colors.black,
  //                                                             fontSize: 15),
  //                                                       )
  //                                                     ],
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               TextButton(
  //                                                 onPressed: () {
  //                                                   setState(() {
  //                                                     removeCart(index);
  //                                                   });
  //                                                 },
  //                                                 child: Icon(
  //                                                   Icons.delete,
  //                                                   color: Colors.grey,
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         );
  //                                       },
  //                                       separatorBuilder: (context, index) {
  //                                         return Divider();
  //                                       },
  //                                       itemCount: cart.length),
  //                                 ),
  //                               ),
  //                               Container(
  //                                   height: 50,
  //                                   width: 300,
  //                                   decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(50),
  //                                       gradient: LinearGradient(
  //                                           begin: Alignment.centerLeft,
  //                                           end: Alignment.centerRight,
  //                                           colors: [
  //                                             Colors.blueAccent,
  //                                             Colors.greenAccent
  //                                           ])),
  //                                   child: TextButton(
  //                                       style: TextButton.styleFrom(
  //                                         primary: Colors.white,
  //                                       ),
  //                                       onPressed: () {
  //                                         setState(() {
  //                                           print('Buy');
  //                                         });
  //                                       },
  //                                       child: Center(
  //                                         child: Text(
  //                                           'Buy',
  //                                           style: TextStyle(
  //                                               color: Colors.white,
  //                                               fontSize: 20),
  //                                         ),
  //                                       ))),
  //                             ],
  //                           )
  //                         : Center(
  //                             child: Column(
  //                             children: [
  //                               Text('No Items'),
  //                             ],
  //                           )),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }
}
