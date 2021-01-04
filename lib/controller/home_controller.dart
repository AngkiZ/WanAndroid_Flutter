import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/DataDao.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/model/bean/article_entity.dart';
import 'package:flutter_demo/model/bean/banner_bean_entity.dart';
import 'package:flutter_demo/net/dio_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'app_controller.dart';

class HomeController extends GetxController {

  final bannerList = List<BannerBeanEntity>().obs;
  final articleList = List<Rx<ArticleEntity>>().obs;

  @override
  void onInit() {
    super.onInit();
    getBannerData();
    getArticleList();
  }

  void getBannerData() {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false)
    );
    DataDao.instance.getBanner().then((value) {
      if(value.errorCode == 0) {
        bannerList.assignAll(value.data);
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    }).whenComplete(() {
      Get.back();
    });
  }

  void getArticleList() {
    DataDao.instance.getArticleList(0).then((value) {
      if(value.errorCode == 0) {
        articleList.assignAll(value.data.datas.map((e) => Rx(e)));
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    });
  }

  void addCollect(int id, int index) {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false)
    );
    DataDao.instance.addCollect(id).then((value) {
      if(value) {
        articleList[index].update((val) {
          val.collect = true;
        });
        Fluttertoast.showToast(msg: "收藏成功");
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    }).whenComplete(() {
      Get.back();
    });
  }

  void unCollect(int id, int index) {
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false)
    );
    DataDao.instance.unCollectInArticleList(id).then((value) {
      if(value) {
        articleList[index].update((val) {
          val.collect = false;
        });
        Fluttertoast.showToast(msg: "取消收藏");
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.message);
    }).whenComplete(() => Get.back());
  }

  void unCollectFromCollectController(int id) {
    articleList.forEach((element) {
      if(element.value.id == id) {
        element.update((val) {
          val.collect = false;
        });
        return;
      }
    });
  }

}
