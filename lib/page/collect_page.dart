
import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/collect_controller.dart';
import 'package:get/get.dart';

import 'widget/list_item.dart';

class CollectPage extends GetView<CollectController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        title: Text('收藏文章', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: collectList(),
    );
  }

  Widget collectList() {
    return Obx(() {
      return ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        itemCount: controller.collectList.length,
        itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          var data = controller.collectList[index];
          return ItemCollect(data, (){
            controller.unCollect(data.id, data.originId, index);
          });
        },
      );
    });
  }
}