import 'package:flutter_demo/model/bean/collect_entity.dart';

collectEntityFromJson(CollectEntity data, Map<String, dynamic> json) {
	if (json['author'] != null) {
		data.author = json['author']?.toString();
	}
	if (json['chapterId'] != null) {
		data.chapterId = json['chapterId']?.toInt();
	}
	if (json['chapterName'] != null) {
		data.chapterName = json['chapterName']?.toString();
	}
	if (json['courseId'] != null) {
		data.courseId = json['courseId']?.toInt();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['envelopePic'] != null) {
		data.envelopePic = json['envelopePic']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['link'] != null) {
		data.link = json['link']?.toString();
	}
	if (json['niceDate'] != null) {
		data.niceDate = json['niceDate']?.toString();
	}
	if (json['origin'] != null) {
		data.origin = json['origin']?.toString();
	}
	if (json['originId'] != null) {
		data.originId = json['originId']?.toInt();
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toInt();
	}
	if (json['visible'] != null) {
		data.visible = json['visible']?.toInt();
	}
	if (json['zan'] != null) {
		data.zan = json['zan']?.toInt();
	}
	return data;
}

Map<String, dynamic> collectEntityToJson(CollectEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['author'] = entity.author;
	data['chapterId'] = entity.chapterId;
	data['chapterName'] = entity.chapterName;
	data['courseId'] = entity.courseId;
	data['desc'] = entity.desc;
	data['envelopePic'] = entity.envelopePic;
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['niceDate'] = entity.niceDate;
	data['origin'] = entity.origin;
	data['originId'] = entity.originId;
	data['publishTime'] = entity.publishTime;
	data['title'] = entity.title;
	data['userId'] = entity.userId;
	data['visible'] = entity.visible;
	data['zan'] = entity.zan;
	return data;
}