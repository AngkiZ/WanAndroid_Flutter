
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_demo/model/BaseResult.dart';
import 'package:flutter_demo/model/bean/article_entity.dart';
import 'package:flutter_demo/model/bean/banner_bean_entity.dart';
import 'package:flutter_demo/model/result/article_result_entity.dart';
import 'package:flutter_demo/model/result/collect_result_entity.dart';
import 'package:flutter_demo/model/result/login_result_entity.dart';
import 'package:flutter_demo/net/CustomInterceptor.dart';
import 'package:flutter_demo/net/dio_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: 'https://www.wanandroid.com/')
abstract class RestClient {

  factory RestClient({String baseUrl}) {
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @GET('/banner/json')
  Future<BaseResultList<BannerBeanEntity>> getBanner();

  @GET('/article/list/{index}/json')
  Future<BaseResult<ArticleResultEntity>> getArticleList(@Path("index") int index);

  @POST('/user/login')
  @FormUrlEncoded()
  Future<Response> login(@Field('username') String userName, @Field('password') String password);

  @GET('/lg/collect/list/{index}/json')
  Future<BaseResult<CollectResultEntity>> getCollectList(@Path('index') int index);

  @POST('/lg/collect/{id}/json')
  Future<BaseResult<String>> addCollect(@Path('id') int id);

  @POST('/lg/uncollect_originId/{id}/json')
  Future<BaseResult<String>> unCollectInArticleList(@Path('id') int id);

  @POST('/lg/uncollect/{id}/json')
  @FormUrlEncoded()
  Future<BaseResult<String>> unCollectInCollectList(@Path('id') int id, {@Field('originId') int originId = -1});
}