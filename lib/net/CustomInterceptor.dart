import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:flutter_demo/util/sp_manager.dart';
import 'package:get/get.dart';

import 'AppException.dart';
import 'dio_manager.dart';

/// 错误处理拦截器
class CustomInterceptor extends Interceptor {
  @override
  Future onError(DioError err) {
    // error统一处理
    AppException appException = AppException.create(err);
    // 错误提示
    debugPrint('DioError===: ${appException.toString()}');
    err.error = appException;
    return super.onError(err);
  }

  @override
  Future onResponse(response) async {
    var data = response.data;
    if(data is String) {
      data = json.decode(data);
    }
    if(data is Map) {
      int errorCode = data['errorCode'] ?? 0; // 表示如果data['errorCode']为空的话把 0赋值给errorCode
      String errorMsg = data['errorMsg'] ?? '请求失败[$errorCode]';
      if (errorCode == 0) { // 正常
        return response;
      } else if (errorCode == -1001 /*未登录错误码*/) {

        SpManager.clearUserInfo();
        dio.clear(); // 调用拦截器的clear()方法来清空等待队列。
        goLogin();

        return dio.reject(errorMsg); // 完成和终止请求/响应
      } else {
        return dio.reject(errorMsg); // 完成和终止请求/响应
      }
    }
    return response;
  }

  void goLogin() {
    Get.toNamed(Routes.LOGIN);
  }
}