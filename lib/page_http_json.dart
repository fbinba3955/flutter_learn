import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flu_learn/bean/weixin_entity.dart';

///一个头条信息列表
class HttpJson extends StatefulWidget {

  HttpJson({Key key}):super(key:key);

  @override
  _State createState() => _State();
}

class _State extends State<HttpJson> {

  var displayText = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http与Json'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _BuildToutiaoList(),
      ),
    );
  }

  Widget _BuildToutiaoList() {
    return Column(
      children: <Widget>[
        Text(displayText),
        RaisedButton(
          onPressed: () {
            _doGetData();
          },
          child: Text('加载数据'),
        ),
      ],
    );
  }

  void _doGetData() async {
    try {
      Response response;
      response = await Dio().get("http://v.juhe.cn/weixin/query?pno=&ps=&dtype=&key=8c827b95bffceb3df8f00b5cc03b496b");//万年历
      var entity = WeixinEntity.fromJson(response.data);
      setState(() {
        displayText = entity.reason;
      });
    } catch (e) {
      return print(e);
    }
  }
}
