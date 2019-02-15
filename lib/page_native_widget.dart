import 'package:flutter/material.dart';

class NativeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用Android Native控件'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.lightBlue,
        child: SizedBox(
          height: 100.0,
          width: 200.0,
          child: AndroidView(viewType: 'MyTextView'),
        )
      ),
    );
  }
}