import 'dart:async';
import 'package:flutter/material.dart';

class TestBloc {
  String text;
  StreamController<String> textController = StreamController<String>();
  get textStream => textController.stream;
  get textSink => textController.sink.add(text);
}

class TestBlocWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TestBloc testBloc = TestBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test BloC'),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(controller: controller),
            TextButton(
                onPressed: () {
                  testBloc.text = controller.text;
                  print(testBloc.text);
                },
                child: Text('Click')),
                StreamBuilder<TestBloc>(stream: ,
                builder: (context,snapshot){

                },)
          ],
        ),
      ),
    );
  }
}
