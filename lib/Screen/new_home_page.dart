import 'package:ecommerce/Screen/cart_screen.dart';
import 'package:ecommerce/Screen/new_cart_screen.dart';
import 'package:ecommerce/Screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Model/product_info.dart';
// import 'package:ecommerce/get_api.dart';

class NewHomePage extends StatefulWidget {
  final index;
  NewHomePage({this.index});
  @override
  _NewHomePageState createState() => _NewHomePageState(index);
}

class _NewHomePageState extends State<NewHomePage> {
  List<ProductInfoModel> cart = [];
  final index;
  _NewHomePageState(this.index);
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
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home')]),
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
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
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
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 150,
                              height: 500,
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                      width: 100,
                                      child: Image(
                                          image: AssetImage(
                                              '${product[index].image}'))),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
              ),
            ],
          ),
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
  //                                           removeCart(index);
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
