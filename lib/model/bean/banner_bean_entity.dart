import 'package:flutter_demo/generated/json/base/json_convert_content.dart';

class BannerBeanEntity with JsonConvert<BannerBeanEntity> {
	String desc;
	double id;
	String imagePath;
	double isVisible;
	double order;
	String title;
	double type;
	String url;
}
