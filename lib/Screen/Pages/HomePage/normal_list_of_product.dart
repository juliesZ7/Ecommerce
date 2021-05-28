import 'package:ecommerce/Model/Product_Info_Model.dart';
import 'package:ecommerce/Screen/product_screen.dart';
import 'package:flutter/material.dart';

class NormalListOfProduct extends StatefulWidget {
  final List<APIProductModel> cart;
  final List<APIProductModel> product;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  NormalListOfProduct(
      {this.cart, this.product, this.addItemCartCB, this.removeItemCartCB});
  @override
  _NormalListOfProductState createState() => _NormalListOfProductState(
      product: product,
      cart: cart,
      addItemCartCB: addItemCartCB,
      removeItemCartCB: removeItemCartCB);
}

class _NormalListOfProductState extends State<NormalListOfProduct> {
  final List<APIProductModel> cart;
  final List<APIProductModel> product;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  _NormalListOfProductState(
      {this.cart, this.product, this.addItemCartCB, this.removeItemCartCB});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 1280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Container(
              height: 300,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.topCenter,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                    index: index,
                                    cart: cart,
                                    addItemCartCB: addItemCartCB,
                                    removeItemCartCB: removeItemCartCB,
                                  ),
                                ));
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey[400], width: 1),
                                color: Colors.white),
                            width: 230,
                            height: 250,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                      height: 140,
                                      child: Image(
                                          image: AssetImage(
                                              '${product[index].image}'))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Text('${product[index].name}',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      height: 30,
                                      child: Text('${product[index].price}',
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                  itemCount: product.length),
            ),
          ),
        ),
      ],
    );
  }
}
