import 'package:flutter_demo/controller/collect_controller.dart';
import 'package:flutter_demo/controller/home_controller.dart';
import 'package:flutter_demo/page/article_page.dart';
import 'package:flutter_demo/page/collect_page.dart';
import 'package:flutter_demo/page/home_page.dart';
import 'package:flutter_demo/page/login_page.dart';
import 'package:flutter_demo/page/welcome_page.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.WELCOME, page: () => WelcomePage()),
    GetPage(
        name: Routes.HOME,
        page: () => Home(),
        binding: BindingsBuilder(
            () => {Get.lazyPut<HomeController>(() => HomeController())})
    ),
    GetPage(name: Routes.ARTICLE, page: () => ArticlePage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(
        name: Routes.COLLECT,
        page: () => CollectPage(),
        binding: BindingsBuilder(
            () => {Get.lazyPut<CollectController>(() => CollectController())})
    ),
  ];
}
