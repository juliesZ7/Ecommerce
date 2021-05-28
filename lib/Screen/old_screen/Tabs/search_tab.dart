import 'package:ecommerce/Api/Model/product_model.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  final String searchKeyFromMainPage;
  final List<ProductModel> products;
  SearchTab({
    this.searchKeyFromMainPage,
    this.products,
  });
  @override
  _SearchTabState createState() => _SearchTabState(
        searchKeyFromMainPage: searchKeyFromMainPage,
      );
}

class _SearchTabState extends State<SearchTab> {
  final String searchKeyFromMainPage;
  final List<ProductModel> products;
  final List<ProductModel> searchResult = [];
  _SearchTabState({
    this.searchKeyFromMainPage,
    this.products,
  });
  TextEditingController searchKey = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            child: Column(
              children: [
                Container(
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
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search anything!',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                      ),
                      // (searchKeyFromMainPage.isNotEmpty)
                      //     ? _search(searchKeyFromMainPage)
                      //     : _search(searchKey.text),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _search(String text) {
    int i;
    for (i = 0; i <= products.length; i++) {
      if (products[i].name.contains(text)) {
        searchResult.add(products[i]);
      }
    }
    if (searchResult.isEmpty)
      return Center(
        child: Text('No data'),
      );
    return ListView.separated(
        itemBuilder: (context, i) => Container(
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      '${searchResult[i].image}',
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${searchResult[i].name}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        '${searchResult[i].price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
        separatorBuilder: (context, i) => Divider(),
        itemCount: searchResult.length);
  }
}