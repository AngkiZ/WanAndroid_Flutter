import 'package:flutter_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_demo/model/bean/article_entity.dart';

class ArticleResultEntity with JsonConvert<ArticleResultEntity> {
	int curPage;
	List<ArticleEntity> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}
