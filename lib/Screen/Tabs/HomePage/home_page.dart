import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/product_screen.dart';
import 'package:flutter/material.dart';

class HomePageTab extends StatefulWidget {
  final List<ProductInfoModel> cart;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  HomePageTab({this.cart, this.addItemCartCB, this.removeItemCartCB});
  @override
  _HomePageTabState createState() => _HomePageTabState(
      cart: cart,
      addItemCartCB: addItemCartCB,
      removeItemCartCB: removeItemCartCB);
}

class _HomePageTabState extends State<HomePageTab> {
  final List<ProductInfoModel> cart;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  int bottomNavigationBarItemIndex = 0;
  _HomePageTabState({this.cart, this.addItemCartCB, this.removeItemCartCB});
  final LinearGradient _fontGradient =
      LinearGradient(colors: <Color>[Colors.redAccent, Colors.orangeAccent]);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1360,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 600,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/graphics/AdsBanner3.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 5, right: 10),
                          child: Container(
                            width: 400,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/graphics/AdsBanner4.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, right: 10),
                          child: Container(
                            width: 400,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/graphics/AdsBanner2.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30, top: 10),
                    //   child: Container(
                    //     child: ShaderMask(
                    //       shaderCallback: (Rect rect) {
                    //         return _fontGradient.createShader(rect);
                    //       },
                    //       child: Text('BEST SALE',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headline4
                    //               .copyWith(
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.white)),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 30),
                      child: Text('BEST DEAL',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 25,
                              fontWeight: FontWeight.w900)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        alignment: Alignment.topLeft,
                        width: 1360,
                        height: 280,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
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
                                              removeItemCartCB:
                                                  removeItemCartCB,
                                            ),
                                          ));
                                    });
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey[400],
                                              blurRadius: 10,
                                            ),
                                          ],
                                          color: Colors.white),
                                      width: 150,
                                      height: 250,
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 50,
                                                child: Text(
                                                    '${product[index].name}',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      height: 30,
                                                      child: Text(
                                                          '${product[index].price}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .redAccent,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .shopping_cart_outlined,
                                                        size: 25,
                                                        color: Colors.grey[500],
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          return addItemCartCB(
                                                              index);
                                                        });
                                                      },
                                                    ),
                                                  )
                                                ],
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
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(50),
                  child: Row(
                    children: [
                      _categories(
                          Icon(
                            Icons.phone,
                            size: 30,
                            color: Colors.white,
                          ),
                          'Phone'),
                      _categories(
                          Icon(
                            Icons.laptop,
                            size: 30,
                            color: Colors.white,
                          ),
                          'Laptop'),
                      _categories(
                          Icon(
                            Icons.photo_camera,
                            size: 30,
                            color: Colors.white,
                          ),
                          'Camera'),
                      _categories(
                          Icon(
                            Icons.watch,
                            size: 30,
                            color: Colors.white,
                          ),
                          'Accessories'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _categories(Icon icon, String label) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.greenAccent]),
          ),
          height: 100,
          width: 100,
          child: TextButton(
            onPressed: () {},
            child: Center(
              // A Category
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  Text(label, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}