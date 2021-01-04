import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home_page.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(
            Icons.brightness_5,
            color: Colors.cyan,
            size: 60,
          ),
          onPressed: () {
            Get.offNamed(Routes.HOME);
          },
        ),
      ),
    );
  }
}