// import 'package:ecommerce/Api/Model/product_info.dart';
// import 'package:flutter/material.dart';

// class NewCartScreen extends StatefulWidget {
//   final List<ProductInfoModel> cart;
//   final index;
//   final Function(int) addItemCartCB;
//   final Function(int) removeItemCartCB;
//   NewCartScreen(
//       {this.cart, this.index, this.addItemCartCB, this.removeItemCartCB});
//   @override
//   _NewCartScreenState createState() => _NewCartScreenState(
//       cart: cart,
//       index: index,
//       addItemCartCB: addItemCartCB,
//       removeItemCartCB: removeItemCartCB);
// }

// class _NewCartScreenState extends State<NewCartScreen> {
//   final List<ProductInfoModel> cart;
//   final index;
//   final Function(int) addItemCartCB;
//   final Function(int) removeItemCartCB;
//   _NewCartScreenState(
//       {this.cart, this.index, this.addItemCartCB, this.removeItemCartCB});
//   ProductInfoModel productInfo = ProductInfoModel();

//   @override
//   Widget build(BuildContext context) {
//     return createDialog(context);
//   }

//   createDialog(BuildContext context) {
//     return showGeneralDialog(
//         barrierDismissible: true,
//         barrierLabel: 'Cart',
//         context: context,
//         pageBuilder: (BuildContext buildContext, Animation animation,
//             Animation secondaryAnimation) {
//           return
//         });
//   }
// }
