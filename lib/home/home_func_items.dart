import 'package:cached_network_image/cached_network_image.dart';
import 'package:flu_learn/page_http_json.dart';
import 'package:flu_learn/page_statefulwidget.dart';
import 'package:flutter/material.dart';
import 'package:flu_learn/page_waterfall_grid.dart';
import 'home_func_item_list.dart';
import 'package:fluro/fluro.dart';

class HomeFuncItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 生成首页数据
     */
    List<HomeFuncItemList> list = new List();
    HomeFuncItemList itemBean;

    //汽车票
    itemBean = new HomeFuncItemList();
    itemBean.id = '1';
    itemBean.content = '瀑布流';
    itemBean.icon = Icons.view_comfy;
    list.add(itemBean);

    //飞机票
    itemBean = new HomeFuncItemList();
    itemBean.id = '2';
    itemBean.content = 'statefulWidget';
    itemBean.icon = Icons.widgets;
    list.add(itemBean);

    //火车票
    itemBean = new HomeFuncItemList();
    itemBean.id = '3';
    itemBean.content = 'http';
    itemBean.icon = Icons.link;
    list.add(itemBean);

    //个人中心
    itemBean = new HomeFuncItemList();
    itemBean.id = '4';
    itemBean.content = '个人中心';
    itemBean.icon = Icons.account_circle;
    list.add(itemBean);

//    for (int i = 5; i < 15; i++) {
//      itemBean = new HomeFuncItemList();
//      itemBean.id = '$i';
//      itemBean.content = '个人中心';
//      itemBean.icon = Icons.account_circle;
//      list.add(itemBean);
//    }

    /**
     * 跳转瀑布流
     */
    void _gotoWaterfallPage(BuildContext context, String content) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WaterfallWidget(
                  content: content,
                )),
      );
    }

    /**
     * 跳转到statefule
     */
    void _gotoStateful(BuildContext context, String content) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyStatefuWidget()),
      );
    }

    /**
     * 跳转到httpjson
     */
    void _gotoHttpJson(BuildContext context, String content) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HttpJson(),
        ),
      );
    }

    /**
     * 创建一个item
     */
    Widget _buildItem(BuildContext context, HomeFuncItemList bean) {
      final router = Router();

      return Material(
        child: InkWell(
          onTap: () {
            if (bean.id == '1') {
              _gotoWaterfallPage(context, bean.content);
            } else if (bean.id == '2') {
              _gotoStateful(context, bean.content);
            } else if (bean.id == '3') {
              _gotoHttpJson(context, bean.content);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                child: Icon(
                  bean.icon,
                  color: Colors.black,
                ),
              ),
              Text(
                bean.content,
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true, ////上划后是否让bar保持在顶部
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('畅途汽车票'),
              background: CachedNetworkImage(
                imageUrl:
                    'http://image.881023.top/uploads/big/4ab4ee1bba24e3f0e7e4b9158534b22d.jpg',
                placeholder: CircularProgressIndicator(),
                errorWidget: Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) {
                return _buildItem(context, list[i]);
              },
              childCount: list.length,
            ),
          ),
        ],
      ),
    );
  }
}
