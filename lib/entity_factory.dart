import 'package:flu_learn/bean/toutiao_entity.dart';
import 'package:flu_learn/bean/weixin_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ToutiaoEntity") {
      return ToutiaoEntity.fromJson(json) as T;
    } else if (T.toString() == "WeixinEntity") {
      return WeixinEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}