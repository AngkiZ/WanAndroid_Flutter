
import 'package:dio/dio.dart';
import 'package:flutter_demo/common/constant.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/model/BaseResult.dart';
import 'package:flutter_demo/model/bean/article_entity.dart';
import 'package:flutter_demo/model/bean/banner_bean_entity.dart';
import 'package:flutter_demo/model/result/article_result_entity.dart';
import 'package:flutter_demo/model/result/collect_result_entity.dart';
import 'package:flutter_demo/model/result/login_result_entity.dart';
import 'package:flutter_demo/net/AppException.dart';
import 'package:flutter_demo/net/RestClient.dart';
import 'package:flutter_demo/net/dio_manager.dart';
import 'package:flutter_demo/util/sp_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataDao {

  RestClient _client;

  // 工厂模式
  factory DataDao() => _getInstance();

  static DataDao get instance => _getInstance();
  static DataDao _instance;

  static DataDao _getInstance() {
    if(_instance == null) {
      _instance = new DataDao._internal();
    }
    return _instance;
  }

  DataDao._internal() {
    _client = new RestClient();
  }

  Future<BaseResultList<BannerBeanEntity>> getBanner() async {
    return await _client.getBanner();
  }

  Future<BaseResult<ArticleResultEntity>> getArticleList(int index) async {
    return await _client.getArticleList(index);
  }

  Future<BaseResult<LoginResultEntity>> login(String account, String password) async {
    try {
      var response = await _client.login(account, password);
      var data = BaseResult<LoginResultEntity>.fromJson(
          response.data
      );
      if(data.errorCode == 0) {
        //cookie
        var cookies = response.headers["set-cookie"];
        SpManager.saveUserInfo(cookies, data.data.username);

        return data;
      }else {
        return Future.error(AppException(data.errorCode, data.errorMsg));
      }
    }catch(error) {
      return Future.error(error);
    }
  }

  Future<CollectResultEntity> getCollectList(int index) async {
    try {
      var data = await _client.getCollectList(index);
      if(data.errorCode == 0) {
        return data.data;
      }else {
        return Future.error(AppException(data.errorCode, data.errorMsg));
      }
    }catch(error) {
      return Future.error(AppException(-1, error.toString()));
    }
  }

  Future<bool> addCollect(int id) async {
    try {
      var data = await _client.addCollect(id);
      if(data.errorCode == 0) {
        return true;
      }else {
        return Future.error(AppException(data.errorCode, data.errorMsg));
      }
    }catch(error) {
      return Future.error(error);
    }
  }

  Future<bool> unCollectInArticleList(int id) async {
    try {
      var data = await _client.unCollectInArticleList(id);
      if(data.errorCode == 0) {
        return true;
      }else {
        return Future.error(AppException(data.errorCode, data.errorMsg));
      }
    }catch(error) {
      return Future.error(error);
    }
  }

  Future<bool> unCollectInCollectList(int id, {int originId = -1}) async {
    try{
      var data = await _client.unCollectInCollectList(id, originId: originId);
      if(data.errorCode == 0) {
        return true;
      }else {
        return Future.error(AppException(data.errorCode, data.errorMsg));
      }
    }catch(error) {
      return Future.error(error);
    }
  }
}