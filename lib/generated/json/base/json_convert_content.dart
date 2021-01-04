// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_demo/model/bean/collect_entity.dart';
import 'package:flutter_demo/generated/json/collect_entity_helper.dart';
import 'package:flutter_demo/model/result/article_result_entity.dart';
import 'package:flutter_demo/generated/json/article_result_entity_helper.dart';
import 'package:flutter_demo/model/result/collect_result_entity.dart';
import 'package:flutter_demo/generated/json/collect_result_entity_helper.dart';
import 'package:flutter_demo/model/bean/article_entity.dart';
import 'package:flutter_demo/generated/json/article_entity_helper.dart';
import 'package:flutter_demo/model/result/login_result_entity.dart';
import 'package:flutter_demo/generated/json/login_result_entity_helper.dart';
import 'package:flutter_demo/model/bean/banner_bean_entity.dart';
import 'package:flutter_demo/generated/json/banner_bean_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case CollectEntity:
				return collectEntityFromJson(data as CollectEntity, json) as T;
			case ArticleResultEntity:
				return articleResultEntityFromJson(data as ArticleResultEntity, json) as T;
			case CollectResultEntity:
				return collectResultEntityFromJson(data as CollectResultEntity, json) as T;
			case ArticleEntity:
				return articleEntityFromJson(data as ArticleEntity, json) as T;
			case ArticleTag:
				return articleTagFromJson(data as ArticleTag, json) as T;
			case LoginResultEntity:
				return loginResultEntityFromJson(data as LoginResultEntity, json) as T;
			case BannerBeanEntity:
				return bannerBeanEntityFromJson(data as BannerBeanEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case CollectEntity:
				return collectEntityToJson(data as CollectEntity);
			case ArticleResultEntity:
				return articleResultEntityToJson(data as ArticleResultEntity);
			case CollectResultEntity:
				return collectResultEntityToJson(data as CollectResultEntity);
			case ArticleEntity:
				return articleEntityToJson(data as ArticleEntity);
			case ArticleTag:
				return articleTagToJson(data as ArticleTag);
			case LoginResultEntity:
				return loginResultEntityToJson(data as LoginResultEntity);
			case BannerBeanEntity:
				return bannerBeanEntityToJson(data as BannerBeanEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (CollectEntity).toString()){
			return CollectEntity().fromJson(json);
		}	else if(type == (ArticleResultEntity).toString()){
			return ArticleResultEntity().fromJson(json);
		}	else if(type == (CollectResultEntity).toString()){
			return CollectResultEntity().fromJson(json);
		}	else if(type == (ArticleEntity).toString()){
			return ArticleEntity().fromJson(json);
		}	else if(type == (ArticleTag).toString()){
			return ArticleTag().fromJson(json);
		}	else if(type == (LoginResultEntity).toString()){
			return LoginResultEntity().fromJson(json);
		}	else if(type == (BannerBeanEntity).toString()){
			return BannerBeanEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(List<CollectEntity>() is M){
			return data.map((e) => CollectEntity().fromJson(e)).toList() as M;
		}	else if(List<ArticleResultEntity>() is M){
			return data.map((e) => ArticleResultEntity().fromJson(e)).toList() as M;
		}	else if(List<CollectResultEntity>() is M){
			return data.map((e) => CollectResultEntity().fromJson(e)).toList() as M;
		}	else if(List<ArticleEntity>() is M){
			return data.map((e) => ArticleEntity().fromJson(e)).toList() as M;
		}	else if(List<ArticleTag>() is M){
			return data.map((e) => ArticleTag().fromJson(e)).toList() as M;
		}	else if(List<LoginResultEntity>() is M){
			return data.map((e) => LoginResultEntity().fromJson(e)).toList() as M;
		}	else if(List<BannerBeanEntity>() is M){
			return data.map((e) => BannerBeanEntity().fromJson(e)).toList() as M;
		}
		return null;
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}