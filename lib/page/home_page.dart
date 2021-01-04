
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/app_controller.dart';
import 'package:flutter_demo/controller/home_controller.dart';
import 'package:flutter_demo/controller/login_controller.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

import '../main.dart';
import 'widget/list_item.dart';

class Home extends GetView<HomeController> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildLeftDrawer(),
      body: Column(
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Obx(() => _banner()),
                Positioned(
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon(Icons.dehaze, color: Colors.black,),
                      onPressed: (){
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    radius: 20,
                    backgroundColor: Color(0x99ffffff),
                  ),
                  top: 25,
                  left: 0,
                )
              ],
            )
          ),
          ArticleList()
        ],
      )
    );
  }

  Widget _banner() {
    return Swiper(
      key: ValueKey(controller.bannerList.length),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Image.network(
            controller.bannerList[index].imagePath,
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: controller.bannerList.length,
      onTap: (int index) {
        controller.getArticleList();
      },
    );
  }

  Drawer _buildLeftDrawer() => Drawer(
    elevation: 0,
    child: GetX<AppController>(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    _.isLogin.value ? _.userInfo.value.username : "请登录",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                  onPressed: () {
                    if(!_.isLogin.value) {
                      Get.toNamed(Routes.LOGIN);
                    }
                  },
                )
            ),
            _buildDrawerText("我的收藏", _.isLogin.value),
            Divider(
              color: Colors.blueGrey,
              height: 1,
              indent: 20,
            )
          ],
        );
      },
    ),
  );

  GestureDetector _buildDrawerText(String data, bool isLogin) => GestureDetector(
    onTap: (){
      if(isLogin) {
        Get.toNamed(Routes.COLLECT);
      }
    },
    child: Container(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 5),
      child: Text(
        data,
        style: TextStyle(
            color: Colors.black,
            fontSize: 20
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class ArticleList extends GetView<HomeController> {

  var appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          itemCount: controller.articleList.length,
          itemExtent: 100,
          itemBuilder: (BuildContext context, int index) {
            var data = controller.articleList[index];
            return Obx(() {
              return ItemArticle(data.value, () {
                if(appController.isLogin.value) {
                  if(data.value.collect) {
                    controller.unCollect(data.value.id, index);
                  }else {
                    controller.addCollect(data.value.id, index);
                  }
                }else {
                  Get.toNamed(Routes.LOGIN);
                }
              });
            });
          },
        );
      })
    );
  }
}