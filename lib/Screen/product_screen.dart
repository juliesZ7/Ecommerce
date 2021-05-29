import 'package:ecommerce/Bloc/block_state.dart';
import 'package:ecommerce/Bloc/product_bloc.dart';
import 'package:ecommerce/Screen/Pages/Cart_Page/Cart_Page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Model/API_Product_Model.dart';
import '../Model/API_Product_Model.dart';

class ProductScreen extends StatefulWidget {
  final List<APIProductModel> cart;
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
  final List<APIProductModel> cart;
  final index;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  _ProductScreenState(
      {this.index, this.cart, this.addItemCartCB, this.removeItemCartCB});
  final _productBloc = ProductBloc();
  @override
  void initState() {
    _productBloc.fetchAllData();
    super.initState();
  }

  // addCart(int index) {}

  // removeCart(int index) {
  //   setState(() {
  //     cart.remove(cart[index]);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _productBloc.allData,
        builder: (context, AsyncSnapshot<List<APIProductModel>> snapshot) {
          if (snapshot.hasData) {
            final product = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.grey[100],
              body: SingleChildScrollView(
                child: Center(
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
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
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
                                                      builder: (context) =>
                                                          CartPage(
                                                            cart: cart,
                                                            removeItemCartCB:
                                                                removeItemCartCB,
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
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 500,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    '${product[index].image}',
                                    width: 400,
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Container(
                                    width: 816,
                                    height: 400,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${product[index].name}',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            '${product[index].price}',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Container(
                                            height: 50,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.orange),
                                            child: TextButton(
                                              child: Text(
                                                'Add to cart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  addItemCartCB(index);
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
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 30),
                                      child: Text(
                                        'Chi tiết sản phẩm',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 20,
                                          bottom: 20),
                                      child:
                                          Text('${product[index].description}'),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
            );
          }
          return StreamBuilder(
            stream: _productBloc.allDataState,
            builder: (context, state) {
              if (!state.hasData || state.data == BlocState.fetching) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          accentColor: Theme.of(context).textTheme.button.color,
                        ),
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return SizedBox();
            },
          );
        });
  }
}
