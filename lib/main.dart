import 'package:flutter/material.dart';
import 'home/home_func_items.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '畅途网',
      home: Scaffold(
        body: SliverTestWighet(),
      ),
    );
  }
}

class SliverTestWighet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeFuncItems();
  }
}
