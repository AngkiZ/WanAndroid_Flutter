import 'package:flutter_demo/generated/json/base/json_convert_content.dart';

class ArticleEntity with JsonConvert<ArticleEntity> {
	String apkLink;
	double audit;
	String author;
	bool canEdit;
	double chapterId;
	String chapterName;
	bool collect;
	double courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	double publishTime;
	double realSuperChapterId;
	double selfVisible;
	double shareDate;
	String shareUser;
	double superChapterId;
	String superChapterName;
	List<ArticleTag> tags;
	String title;
	double type;
	double userId;
	double visible;
	double zan;
}

class ArticleTag with JsonConvert<ArticleTag> {
	String name;
	String url;
}
