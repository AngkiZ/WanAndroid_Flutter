
import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/home_controller.dart';
import 'package:flutter_demo/dao/DataDao.dart';
import 'package:flutter_demo/model/bean/collect_entity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../main.dart';

class CollectController extends GetxController {

  final collectList = List<CollectEntity>().obs;

  @override
  void onInit() {
    super.onInit();
    getCollectList();
  }

  void getCollectList() {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false)
    );
    DataDao.instance.getCollectList(0).then((value) => {
      collectList.addAll(value.datas)
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    }).whenComplete(() => {
      Get.back()
    });
  }

  void unCollect(int id, int originId, int index) {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false)
    );
    DataDao.instance.unCollectInCollectList(id, originId: originId).then((value) {
      if(value) {
        collectList.removeAt(index);
        Fluttertoast.showToast(msg: "取消收藏");
        var homeController = Get.find<HomeController>();
        homeController.unCollectFromCollectController(originId);
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    }).whenComplete(() => Get.back());
  }
}