
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'CustomInterceptor.dart';

Dio _dio = Dio();
Dio get dio => _dio;

class DioManager{
  static Future init() async {
    dio.options.connectTimeout = 30 * 1000;
    dio.options.sendTimeout = 30 * 1000;
    dio.options.receiveTimeout = 30 * 1000;
    //添加拦截器
    dio.interceptors.add(CustomInterceptor());
    dio.interceptors.add(LogInterceptor(responseBody: true));
    //cookie
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path + "/dioCookie";
    print('DioUtil : http cookie path = $tempPath');
    CookieJar cj = PersistCookieJar(dir: tempPath, ignoreExpires: true);
    dio.interceptors.add(CookieManager(cj));
  }
}