
import 'package:flutter_demo/model/bean/banner_bean_entity.dart';
import 'package:flutter_demo/model/result/collect_result_entity.dart';

import 'result/article_result_entity.dart';
import 'result/login_result_entity.dart';

class BaseResult<T> {
  T data;
  int errorCode;
  String errorMsg;

  BaseResult({this.data, this.errorCode, this.errorMsg});

  factory BaseResult.fromJson(Map<String, dynamic> json) {
    return BaseResult<T>(
        data: json['data'] != null ? EntityFactory.generateOBJ<T>(json['data']) : null,
        errorCode: (null == json['errorCode']) ? -1 : json['errorCode'],
        errorMsg: (null == json['errorMsg']) ? "" : json['errorMsg']
    );
  }
}

class BaseResultList<T> {
  List<T> data;
  int errorCode;
  String errorMsg;

  BaseResultList({this.data, this.errorCode, this.errorMsg});

  factory BaseResultList.fromJson(Map<String, dynamic> json) {
    List dataJson = json['data'];
    var list = new List<T>();
    if ( dataJson != null) {
      list.addAll(dataJson.map((dynamic i) => EntityFactory.generateOBJ<T>(i as Map<String, dynamic>)).toList());
    }

    return BaseResultList<T> (
        errorCode: (null == json['errorCode']) ? -1 : json['errorCode'],
        errorMsg: (null == json['errorMsg']) ? "" : json['errorMsg'],
        data: list
    );
  }
}


class EntityFactory {
  // ignore: missing_return
  static T generateOBJ<T>(json) {
    switch(T.toString()) {
      case "BannerBeanEntity":
        return BannerBeanEntity().fromJson(json) as T;
      case "ArticleResultEntity":
        return ArticleResultEntity().fromJson(json) as T;
      case "LoginResultEntity":
        return LoginResultEntity().fromJson(json) as T;
      case "CollectResultEntity":
        return CollectResultEntity().fromJson(json) as T;
    }
  }
}