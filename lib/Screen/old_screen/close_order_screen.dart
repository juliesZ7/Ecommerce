import 'package:flutter/material.dart';

class CloseOrder extends StatefulWidget {
  @override
  _CloseOrderState createState() => _CloseOrderState();
}

class _CloseOrderState extends State<CloseOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Bill payment'),
        centerTitle: true,
      ),
      body: Container(color: Colors.white,),
    );
  }
}
