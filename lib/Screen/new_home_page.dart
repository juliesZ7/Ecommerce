// import 'package:ecommerce/Screen/cart_screen.dart';
// import 'package:ecommerce/Screen/product_screen.dart';
// import 'package:flutter/material.dart';
// import '../product_info.dart';
// import 'package:ecommerce/get_api.dart';

// class NewHomePage extends StatefulWidget {
//   @override
//   _NewHomePageState createState() => _NewHomePageState();
// }

// class _NewHomePageState extends State<NewHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     print(apiList);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           'Home Page',
//           style: TextStyle(color: Colors.blueAccent),
//         ),
//         elevation: 0,
//         centerTitle: true,
//         actions: [
//           Row(
//             children: [
//               Text(
//                 '${cart.length}',
//                 style: TextStyle(
//                     color: Colors.blueAccent,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700),
//               ),
//               IconButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => CartScreen()));
//                   },
//                   icon: Icon(
//                     Icons.shopping_cart,
//                     color: Colors.blueAccent,
//                   ))
//             ],
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, top: 10),
//                 child: Text(
//                   'Best Sale',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 200,
//                 child: Expanded(
//                   child: ListView.separated(
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return TextButton(
//                           onPressed: () {
//                             setState(() {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => ProductScreen(
//                                             index: index,
//                                           )));
//                             });
//                           },
//                           child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               width: 150,
//                               height: 200,
//                               padding: EdgeInsets.all(8),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                       width: 100,
//                                       child: Image(
//                                           image: AssetImage(
//                                               '${product[index].image}'))),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text('${product[index].name}',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w400)),
//                                       Text('${product[index].price}',
//                                           style: TextStyle(
//                                               color: Colors.redAccent,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w600)),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                         );
//                       },
//                       separatorBuilder: (context, index) => SizedBox(
//                             width: 10,
//                           ),
//                       itemCount: product.length),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
