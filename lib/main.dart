import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/app_controller.dart';
import 'package:flutter_demo/net/dio_manager.dart';
import 'package:flutter_demo/page/welcome_page.dart';
import 'package:flutter_demo/routes/app_pages.dart';
import 'package:flutter_demo/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrefixPrinter(PrettyPrinter(colors: false))
);
void main() {
  ///runZoned（）过期，切换成 runZonedGuarded（）
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Container(
        color: Colors.transparent,
      );
    };
    FlutterError.onError = (FlutterErrorDetails details) async {
      FlutterError.dumpErrorToConsole(details);
      Zone.current.handleUncaughtError(details.exception, details.stack);
    };
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,//右上角debug标签
      initialRoute: '/',
      theme: appThemeData,//主题
      defaultTransition: Transition.fade,//过度动画
      getPages: AppPages.pages,
      home: WelcomePage(),
      onInit: () async {
        await DioManager.init();
        Get.put<AppController>(AppController());
      },
    ));
  }, (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}



