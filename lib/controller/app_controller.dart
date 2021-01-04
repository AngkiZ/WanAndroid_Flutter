
import 'package:flutter_demo/common/constant.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/model/result/login_result_entity.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {

  final userInfo = LoginResultEntity().obs;
  final isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    logger.d("11111", "Angki");
    _getUserInfo();
  }

  void _getUserInfo() async {
    var prefs = await SharedPreferences.getInstance();
    var isHasCatch = prefs.containsKey(Constant.SP_COOKIE);
    logger.d("$isHasCatch", "Angki");
    if(isHasCatch) {
      var name = prefs.getString(Constant.SP_NAME);
      userInfo.update((val) {
        val.username = name;
      });
      isLogin.value = true;
    }
  }
}