import 'package:ecommerce/Model/product_info.dart';
import 'package:ecommerce/Screen/Tabs/HomePage/normal_list_of_product.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String searchKeyFromMainPage;
  SearchPage({this.searchKeyFromMainPage});
  @override
  _SearchPageState createState() =>
      _SearchPageState(searchKeyFromMainPage: searchKeyFromMainPage);
}

class _SearchPageState extends State<SearchPage> {
  final String searchKeyFromMainPage;
  final List<ProductInfoModel> searchResult = [];
  _SearchPageState({this.searchKeyFromMainPage});
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
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 1000,
                    width: 1360,
                    child: _search(searchKey.text),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _search(String text) {
    int i;
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
      return Center(child: NormalListOfProduct(product: searchResult));
    }
  }
}
