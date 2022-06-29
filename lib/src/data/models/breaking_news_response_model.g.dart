// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breaking_news_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreakingNewsResponseModel _$BreakingNewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    BreakingNewsResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BreakingNewsResponseModelToJson(
        BreakingNewsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
