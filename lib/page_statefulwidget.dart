import 'package:flutter/material.dart';

class MyStatefuWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyStatefuWidget> {
  int count = 0;

  String content = 'content';

  void _onPressed() {
    setState(() {
      count++;
      content = content + '$count';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('statefulwidget'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(content),
            RaisedButton(
              child: Text('press me'),
              onPressed: _onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
