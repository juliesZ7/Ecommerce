// import 'package:ecommerce/Model/product_info.dart';
// import 'package:ecommerce/Screen/product_screen.dart';
// import 'package:ecommerce/Screen/Tabs/main_page.dart';
// import 'package:flutter/material.dart';

// class HomePageTab extends StatefulWidget {
//   final List<ProductInfoModel> cart;
//   final Function(int) addItemCartCB;
//   final Function(int) removeItemCartCB;
//   HomePageTab({this.cart, this.addItemCartCB, this.removeItemCartCB});
//   @override
//   _HomePageTabState createState() => _HomePageTabState(
//       cart: cart,
//       addItemCartCB: addItemCartCB,
//       removeItemCartCB: removeItemCartCB);
// }

// class _HomePageTabState extends State<HomePageTab> {
//   final List<ProductInfoModel> cart;
//   final Function(int) addItemCartCB;
//   final Function(int) removeItemCartCB;
//   int bottomNavigationBarItemIndex = 0;
//   _HomePageTabState({this.cart, this.addItemCartCB, this.removeItemCartCB});

//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           color: Colors.white,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: screenHeight * 0.005,
//                 ),
//                 Center(
//                   child: Container(
//                       width: screenWidth * 0.97,
//                       height: screenWidth * 0.3,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.red,
//                         image: DecorationImage(
//                             image: AssetImage('assets/graphics/AdsBanner2.jpg'),
//                             fit: BoxFit.fill),
//                       )),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, top: 10),
//                       child: Text(
//                         'Best Sale',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                     Container(
//                       width: screenWidth,
//                       height: screenHeight * 0.38,
//                       child: ListView.separated(
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               child: TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => ProductScreen(
//                                             index: index,
//                                             cart: cart,
//                                             addItemCartCB: addItemCartCB,
//                                             removeItemCartCB: removeItemCartCB,
//                                           ),
//                                         ));
//                                   });
//                                 },
//                                 child: Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey[400],
//                                             blurRadius: 10,
//                                           ),
//                                         ],
//                                         color: Colors.white),
//                                     width: screenWidth * .35,
//                                     height: screenWidth * .55,
//                                     padding: EdgeInsets.all(8),
//                                     child: Column(
//                                       children: [
//                                         Center(
//                                           child: Container(
//                                               width: screenWidth * 0.25,
//                                               child: Image(
//                                                   image: AssetImage(
//                                                       '${product[index].image}'))),
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text('${product[index].name}',
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 18,
//                                                     fontWeight:
//                                                         FontWeight.w400)),
//                                             Text('${product[index].price}',
//                                                 style: TextStyle(
//                                                     color: Colors.redAccent,
//                                                     fontSize: 18,
//                                                     fontWeight:
//                                                         FontWeight.w600)),
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                               ),
//                             );
//                           },
//                           separatorBuilder: (context, index) => SizedBox(
//                                 width: 15,
//                               ),
//                           itemCount: product.length),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
//                   child: Container(
//                     child: Text(
//                       'Categories',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                   child: Row(
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             child: Column(
//                               children: [
//                                 TextButton(
//                                   onPressed: () {},
//                                   child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Center(
//                                       child: Column(
//                                         children: [
//                                           Icon(Icons.phone),
//                                           Text('Phone'),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Center(
//                                   child: Column(
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {},
//                                         icon: Icon(Icons.laptop),
//                                       ),
//                                       Text('Laptop'),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Column(
//                             children: [
//                               IconButton(
//                                   onPressed: () {}, icon: Icon(Icons.fastfood)),
//                               Text('Food')
//                             ],
//                           ),
//                           Column()
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
