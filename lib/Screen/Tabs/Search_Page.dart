import 'package:ecommerce/Model/product_info.dart';
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
                    _search(searchKey.text),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _search(String text) {
    int i;
    for (i = 0; i <= product.length; i++) {
      if (product[i].name.contains(text)) {
        searchResult.add(product[i]);
      }
    }
    if (searchResult.isEmpty)
      return Center(
        child: Text('No data'),
      );
    else {
      i = 0;
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
}
