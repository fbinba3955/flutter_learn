import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

///瀑布流页面
class WaterfallWidget extends StatelessWidget {
  final String content = 'unknown';

  WaterfallWidget({Key key, @required content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('瀑布流'),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: 20,
        itemBuilder: (BuildContext context, int i) {
          var images = [
            'http://image.881023.top/uploads/big/31928db20a34cab5ff276439d51d2d57.png',
            'http://image.881023.top/uploads/big/3f980ef90222a418fce857a57dd7da05.png',
            'http://image.881023.top/uploads/big/09b0d528cc28d68e466f78017cb11f47.png',
            'http://image.881023.top/uploads/big/4b32f550f96331dc99e3c0b73bed6330.png',
            'http://image.881023.top/uploads/big/02410f152e8cb6802df4cbc59974b136.png',
          ];
          var image = images[i % images.length];
          return Container(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(
            1, index % 2 + 1), //参数1:每个子项横向所占空间n/crossAxisCount 参数2：每个子项竖向所占空间
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
