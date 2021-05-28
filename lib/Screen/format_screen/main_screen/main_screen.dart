import 'package:ecommerce/Api/Bloc/block_state.dart';
import 'package:ecommerce/Api/Bloc/product_bloc.dart';
import 'package:ecommerce/Api/Model/product_model.dart';
import 'package:ecommerce/Screen/format_screen/main_screen/component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Screen/old_screen/Tabs/HomePage/home_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _productBloc = ProductBloc();
  List<ProductModel> cart = [];
  int bottomNavigationBarItemIndex;

  bool userState;
  ScrollController scrollControllerVer = new ScrollController();
  ScrollController scrollControllerHor = new ScrollController();
  @override
  void initState() {
    bottomNavigationBarItemIndex = 0;
    userState = false;
    _productBloc.fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, size) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blueAccent, Colors.greenAccent])),
            child: Align(
              alignment: Alignment.topCenter,
              child: StreamBuilder(
                stream: _productBloc.allData,
                builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                  if (snapshot.hasData) {
                    final products = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          //AppBar
                          MainAppBar(
                            cart: cart,
                            userState: userState,
                          ),
                          //Real body
                          Container(
                            height: heightScreen,
                            width: widthScreen,
                            child: Center(
                              child: HomePageTab(
                                cart: cart,
                                addItemCartCB: (int index) {
                                  setState(() {
                                    cart.add(products[index]);
                                  });
                                },
                                removeItemCartCB: (int index) {
                                  setState(() {
                                    cart.remove(cart[index]);
                                  });
                                },
                                products: products,
                              ),
                            ),
                          ),
                        ],
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
                                  accentColor:
                                      Theme.of(context).textTheme.button.color,
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
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
