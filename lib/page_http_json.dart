import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flu_learn/bean/weixin_entity.dart';

///一个头条信息列表
class HttpJson extends StatefulWidget {
  HttpJson({Key key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<HttpJson> {
  WeixinEntity weixinBean;

  var displayText = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http与Json'),
      ),
      body: _buildToutiaoList(context),
    );
  }

  Widget _buildToutiaoList(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(displayText),
        RaisedButton(
          onPressed: () {
            _doGetData();
          },
          child: Text('加载数据'),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _buildListItem(context, index);
            },
            itemCount: _getDataLength(),
          ),
        ),
      ],
    );
  }

  /**
   * 计算列表长度
   */
  int _getDataLength() {
    if (weixinBean == null ||
        null == weixinBean.result ||
        weixinBean.result.xList == null) {
      return 0;
    }
    return weixinBean.result.xList.length;
  }

  /**
   * 创建一个列表项
   */
  Widget _buildListItem(BuildContext context, int index) {
    if (weixinBean.result == null || weixinBean.result.xList == null) {
      return ListTile();
    } else {
      WeixinResultList item = weixinBean.result.xList[index];
      return Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                item.title,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                item.source,
                style: TextStyle(
                  color: Colors.black38
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void _doGetData() async {
    try {
      Response response;
      response = await Dio().get(
          "http://v.juhe.cn/weixin/query?pno=&ps=&dtype=&key=8c827b95bffceb3df8f00b5cc03b496b"); //微信精选
      setState(() {
        weixinBean = WeixinEntity.fromJson(response.data);
        displayText = weixinBean.reason;
      });
    } catch (e) {
      return print(e);
    }
  }
}
