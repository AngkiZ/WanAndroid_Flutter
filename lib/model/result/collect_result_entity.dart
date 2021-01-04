import 'package:flutter_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_demo/model/bean/collect_entity.dart';

class CollectResultEntity with JsonConvert<CollectResultEntity> {
	int curPage;
	List<CollectEntity> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}
