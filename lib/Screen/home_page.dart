import 'package:ecommerce/Screen/cart_screen.dart';
import 'package:flutter/material.dart';
import '../product_info.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.blueAccent),
        ),
        elevation: 0,
        centerTitle: true,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.blueAccent,
                  ))
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Best Sale'),
              Expanded(
                child: Container(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 200,
                            width: 150,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Column(
                              children: [
                                Container(
                                    height: 100,
                                    width: 150,
                                    child: Image(
                                        image: AssetImage(
                                            '${product[index].image}'))),
                                Text('${product[index].name}'),
                                Text('${product[index].price}'),
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: product.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
