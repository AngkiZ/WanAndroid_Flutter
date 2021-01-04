
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {

  final String url = Get.arguments['url'];
  final bool isCollect = Get.arguments['isCollect'];
  final String title = Get.arguments['title'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        title: Text(title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isCollect ? Icons.favorite : Icons.favorite_border,
            color: isCollect ? Colors.red : null
        ),
        onPressed: () {
          Fluttertoast.showToast(msg: '收藏点击！');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted
      ),
    );
  }
}