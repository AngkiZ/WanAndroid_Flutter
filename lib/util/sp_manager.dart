
import 'package:dio/dio.dart';
import 'package:flutter_demo/common/constant.dart';
import 'package:flutter_demo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SpManager {

  static saveUserInfo(List<String> cookie, String name) async {
    //存储cookie
    var prefs = await SharedPreferences.getInstance();
    var isSave = await prefs.setStringList(Constant.SP_COOKIE, cookie);
    logger.d("$isSave", "Angki");
    //存储name
    await prefs.setString(Constant.SP_NAME, name);
  }

  static clearUserInfo() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(Constant.SP_COOKIE);
    await prefs.remove(Constant.SP_NAME);
  }

}