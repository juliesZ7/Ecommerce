import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: 250,
        width: widthScreen,
        color: Colors.blueGrey[900],
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SUPPORT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Raleway'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _textButton('Common Question'),
                  _textButton('Request Support'),
                  _textButton('Give back Instruction')
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CONTACT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Raleway'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'joytectListener@joytect.com',
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Tel.09012345678',
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _textButton(String label) {
    return TextButton(
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white70,
          letterSpacing: 0.5,
        ),
      ),
      onPressed: () {},
    );
  }
}
