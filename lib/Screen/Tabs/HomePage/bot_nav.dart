import 'package:flutter/material.dart';

class BotNav extends StatefulWidget {
  @override
  _BotNavState createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
