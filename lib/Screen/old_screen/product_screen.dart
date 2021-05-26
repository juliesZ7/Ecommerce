import 'package:ecommerce/Screen/old_screen/Tabs/Cart_Tab/cart_tab.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Api/Model/product_model.dart';

class ProductScreen extends StatefulWidget {
  final List<ProductModel> cart;
  final index;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  final List<ProductModel> products;

  ProductScreen({
    this.index,
    this.cart,
    this.addItemCartCB,
    this.removeItemCartCB,
    this.products,
  });
  @override
  _ProductScreenState createState() => _ProductScreenState(
        index: index,
        addItemCartCB: addItemCartCB,
        removeItemCartCB: removeItemCartCB,
        cart: cart,
        products: products,
      );
}

class _ProductScreenState extends State<ProductScreen> {
  final List<ProductModel> cart;
  final index;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  final List<ProductModel> products;
  _ProductScreenState({
    this.index,
    this.cart,
    this.addItemCartCB,
    this.removeItemCartCB,
    this.products,
  });

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
                        image: AssetImage('${products[index].image}'),
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
                              '${products[index].name}',
                              style: TextStyle(fontSize: 30),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                '${products[index].price}',
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
                          child: Text('${products[index].description}'),
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
    );
  }
}
