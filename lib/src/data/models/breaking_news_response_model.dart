import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

part 'breaking_news_response_model.g.dart';

@JsonSerializable()
class BreakingNewsResponseModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  BreakingNewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BreakingNewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreakingNewsResponseModelToJson(this);
}
