import 'package:cached_network_image/cached_network_image.dart';
import 'package:flu_learn/bean/toutiao_entity.dart';
import 'package:flu_learn/common/page_webview.dart';
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
  ToutiaoEntity weixinBean;

  var displayText = 'unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http与Json'),
      ),
      body: _buildInitView(context),
    );
  }

  Widget _buildInitView(BuildContext context) {
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
        weixinBean.result.data == null) {
      return 0;
    }
    return weixinBean.result.data.length;
  }

  /**
   * 创建一个列表项
   */
  Widget _buildListItem(BuildContext context, int index) {
    if (weixinBean.result == null || weixinBean.result.data == null) {
      return ListTile();
    } else {
      ToutiaoResultData item = weixinBean.result.data[index];
      List<Widget> images = List();
      if (item.thumbnailPicS != null) {
        images.add(
          Expanded(
            child: CachedNetworkImage(
              imageUrl: item.thumbnailPicS,
              placeholder: CircularProgressIndicator(),
              errorWidget: Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        );
      }
      if (item.thumbnailPicS02 != null) {
        images.add(
          Expanded(
            child: CachedNetworkImage(
              imageUrl: item.thumbnailPicS02,
              placeholder: CircularProgressIndicator(),
              errorWidget: Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        );
      }
      if (item.thumbnailPicS03 != null) {
        images.add(
          Expanded(
            child: CachedNetworkImage(
              imageUrl: item.thumbnailPicS03,
              placeholder: CircularProgressIndicator(),
              errorWidget: Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        );
      }
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebView(
                    title: item.title,
                    url: item.url,
                  ),
            ),
          );
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                  child: Text(
                    item.title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),

                Row(
                  children: images,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    item.authorName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
  }

  void _doGetData() async {
    try {
      Response response;
      response = await Dio().get(
          "http://v.juhe.cn/toutiao/index?type=top&key=107313447cbaf8c4513f4ab6ab8ad159"); //微信精选
      setState(() {
        weixinBean = ToutiaoEntity.fromJson(response.data);
        displayText = weixinBean.reason;
      });
    } catch (e) {
      return print(e);
    }
  }
}
