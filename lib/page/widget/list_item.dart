import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/bean/article_entity.dart';
import 'package:flutter_demo/model/bean/collect_entity.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:get/get.dart';

class ItemArticle extends StatelessWidget {

  final ArticleEntity data;
  final Function onPressed;

  ItemArticle(this.data, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          var arguments = {'url': data.link, 'isCollect': data.collect, 'title': data.title};
          Get.toNamed(Routes.ARTICLE, arguments: arguments);
        },
        child: Card(
          elevation: 2,
          margin: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                data.title,
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              trailing: IconButton(
                icon: Icon(
                  data.collect ? Icons.favorite : Icons.favorite_border,
                  color: data.collect ? Colors.red : null,
                ),
                onPressed: onPressed
              ),
            ),
          ),
        )
    );
  }
}

class ItemCollect extends StatelessWidget {

  final CollectEntity data;
  final Function onPressed;

  ItemCollect(this.data, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          var arguments = {'url': data.link, 'isCollect': true, 'title': data.title};
          Get.toNamed(Routes.ARTICLE, arguments: arguments);
        },
        child: Card(
          elevation: 2,
          margin: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                data.title,
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: onPressed
              ),
            ),
          ),
        )
    );
  }
}