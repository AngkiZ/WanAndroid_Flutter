import 'package:flutter_demo/generated/json/base/json_convert_content.dart';

class LoginResultEntity with JsonConvert<LoginResultEntity> {
	bool admin;
	List<dynamic> chapterTops;
	int coinCount;
	List<int> collectIds;
	String email;
	String icon;
	int id;
	String nickname;
	String password;
	String publicName;
	String token;
	int type;
	String username;
}
