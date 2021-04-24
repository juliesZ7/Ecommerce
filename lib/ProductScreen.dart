import 'package:flutter/material.dart';
import 'ProductInfo.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductInfo productInfo = ProductInfo();
  @override
  void initState() {
    super.initState();
    productInfo = ProductInfo(
        id: 'ID01',
        image: 'assets/graphics/samsung-galaxy-note-9.jpg',
        name: 'Samsung Galaxy Note 9',
        price: 8000000,
        description: 'Description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blueAccent, Colors.greenAccent])),
        child: TextButton(
          child: Text(
            'Add to cart',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(productInfo.image)),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              productInfo.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              productInfo.price.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.redAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              productInfo.description,
            ),
          ),
        ],
      ),
    );
  }
}
