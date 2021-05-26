import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/Tabs/HomePage/Footer.dart';
import 'package:ecommerce/Screen/Tabs/HomePage/Categories.dart';
import 'package:ecommerce/Screen/Tabs/HomePage/Normal_list_of_product.dart';
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 600,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/graphics/AdsBanner3.jpg'),
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
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //BEST DEAL
                    Container(
                      width: 1280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.orange[700],
                              Colors.orange[700],
                              Colors.deepOrangeAccent[400]
                            ]),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 30),
                                child: Icon(
                                  Icons.stars,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30, left: 5),
                                child: Text('BEST DEAL',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Raleway',
                                        fontStyle: FontStyle.italic)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 20),
                            child: Container(
                              width: 1360,
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
                                                  maintainState: false,
                                                  builder: (context) =>
                                                      ProductScreen(
                                                    index: index,
                                                    cart: cart,
                                                    addItemCartCB:
                                                        addItemCartCB,
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
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //     color: Colors.grey[700],
                                                //     blurRadius: 10,
                                                //   ),
                                                // ],
                                                color: Colors.white),
                                            width: 180,
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
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            height: 30,
                                                            child: Text(
                                                                '${product[index].price}',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                    fontSize:
                                                                        15,
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
                                                              color: Colors
                                                                  .grey[500],
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
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 15,
                                      ),
                                  itemCount: product.length),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                //Categories
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 30),
                  width: 1280,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300], width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'CATEGORIES',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 30,
                              fontFamily: 'Raleway'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Categories(
                                  icon: Icon(
                                    Icons.phone,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Phone'),
                              Categories(
                                  icon: Icon(
                                    Icons.laptop,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Laptop'),
                              Categories(
                                  icon: Icon(
                                    Icons.photo_camera,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Camera'),
                              Categories(
                                  icon: Icon(
                                    Icons.watch,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Accessories'),
                              Categories(
                                  icon: Icon(
                                    Icons.person,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Beauty'),
                              Categories(
                                  icon: Icon(
                                    Icons.tv,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Furniture'),
                              Categories(
                                  icon: Icon(
                                    Icons.live_tv,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Media'),
                              Categories(
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Medicare'),
                              Categories(
                                  icon: Icon(
                                    Icons.support_agent,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: 'Services'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                NormalListOfProduct(
                  cart: cart,
                  addItemCartCB: addItemCartCB,
                  removeItemCartCB: removeItemCartCB,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    color: Colors.blueGrey[900],
                    width: screenWidth,
                    alignment: Alignment.center,
                    child: Footer()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
