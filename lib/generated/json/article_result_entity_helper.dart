import 'package:flutter_demo/model/result/article_result_entity.dart';
import 'package:flutter_demo/model/bean/article_entity.dart';

articleResultEntityFromJson(ArticleResultEntity data, Map<String, dynamic> json) {
	if (json['curPage'] != null) {
		data.curPage = json['curPage']?.toInt();
	}
	if (json['datas'] != null) {
		data.datas = new List<ArticleEntity>();
		(json['datas'] as List).forEach((v) {
			data.datas.add(new ArticleEntity().fromJson(v));
		});
	}
	if (json['offset'] != null) {
		data.offset = json['offset']?.toInt();
	}
	if (json['over'] != null) {
		data.over = json['over'];
	}
	if (json['pageCount'] != null) {
		data.pageCount = json['pageCount']?.toInt();
	}
	if (json['size'] != null) {
		data.size = json['size']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	return data;
}

Map<String, dynamic> articleResultEntityToJson(ArticleResultEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['curPage'] = entity.curPage;
	if (entity.datas != null) {
		data['datas'] =  entity.datas.map((v) => v.toJson()).toList();
	}
	data['offset'] = entity.offset;
	data['over'] = entity.over;
	data['pageCount'] = entity.pageCount;
	data['size'] = entity.size;
	data['total'] = entity.total;
	return data;
}