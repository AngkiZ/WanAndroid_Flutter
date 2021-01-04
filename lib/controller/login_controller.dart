
import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/app_controller.dart';
import 'package:flutter_demo/dao/DataDao.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class LoginController extends GetxController {

  TextEditingController accountTextController;
  TextEditingController passwordTextController;
  bool _isLogin = false;

  @override
  void onInit() {
    super.onInit();
    accountTextController = TextEditingController();
    passwordTextController = TextEditingController();

    accountTextController.text = 'Angki_';
    passwordTextController.text = 'zhuSInan0101';
  }

  @override
  void onClose() {
    super.onClose();
    accountTextController?.dispose();
    passwordTextController?.dispose();
  }

  void login() {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false)
    );
    DataDao.instance.login(accountTextController.text, passwordTextController.text).then((value) {
      if(value.errorCode == 0) {
        var appController = Get.find<AppController>();
        var homeController = Get.find<HomeController>();
        appController.userInfo(value.data);
        appController.isLogin.value = true;
        homeController.getArticleList();
        _isLogin = true;
      }else {
        _isLogin = false;
        Fluttertoast.showToast(msg: value.errorMsg);
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    }).whenComplete(() {
      Get.back();
      if(_isLogin) {
        Get.offNamed(Routes.HOME);
      }
    });
  }
}