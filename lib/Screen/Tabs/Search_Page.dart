import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/Tabs/HomePage/normal_list_of_product.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String searchKeyFromMainPage;
  final List<ProductInfoModel> cart;
  final List<ProductInfoModel> product;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  SearchPage(
      {this.searchKeyFromMainPage,
      this.cart,
      this.product,
      this.addItemCartCB,
      this.removeItemCartCB});
  @override
  _SearchPageState createState() => _SearchPageState(
      cart: cart,
      searchKeyFromMainPage: searchKeyFromMainPage,
      product: product,
      addItemCartCB: addItemCartCB,
      removeItemCartCB: removeItemCartCB);
}

class _SearchPageState extends State<SearchPage> {
  final String searchKeyFromMainPage;
  final List<ProductInfoModel> cart;
  final List<ProductInfoModel> product;
  final Function(int) addItemCartCB;
  final Function(int) removeItemCartCB;
  final List<ProductInfoModel> searchResult = [];
  _SearchPageState(
      {this.cart,
      this.product,
      this.addItemCartCB,
      this.removeItemCartCB,
      this.searchKeyFromMainPage});
  TextEditingController searchKey = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchKeyFromMainPage == null
        ? searchKey.text = null
        : searchKey.text = searchKeyFromMainPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        controller: searchKey,
                        onFieldSubmitted: (summit) {
                          setState(() {
                            searchResult.clear();
                            searchKey.text = summit;
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search anything!',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 1360,
                  child: _search(searchKey.text),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _search(String text) {
    int i;
    if (text == '')
      return Center(
        child: Text('Search something!'),
      );
    else {
      for (i = 0; i < product.length; i++) {
        if (product[i].name.toLowerCase().contains(text.toLowerCase())) {
          searchResult.add(product[i]);
        }
      }
      if (searchResult.isEmpty)
        return Center(
          child: Text('No data'),
        );
      else {
        i = 0;
        return Center(
            child: NormalListOfProduct(
          product: searchResult,
          cart: cart,
          addItemCartCB: addItemCartCB,
          removeItemCartCB: removeItemCartCB,
        ));
      }
    }
  }
}
