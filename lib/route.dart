import 'dart:js';

import 'package:ecommerce/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'cart_screen.dart';

final Map<String, WidgetBuilder> routes = {
  CartScreen.routeName: (context) => CartScreen(),
};
