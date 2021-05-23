import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final Icon icon;
  final String label;
  Categories({this.icon, this.label});
  @override
  Widget build(BuildContext context) {
    return _categories(icon, label);
  }
}

_categories(Icon icon, String label) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: RadialGradient(
              radius: 1, colors: [Colors.blueAccent, Colors.lightBlue[700]]),
        ),
        height: 100,
        width: 100,
        child: TextButton(
          onPressed: () {},
          child: Center(
            // A Category
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                Text(label, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        width: 40,
      ),
    ],
  );
}
