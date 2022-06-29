import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/article.dart';
import 'source_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends Article {
  const ArticleModel({
    required int id,
    required SourceModel source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) : super(
          id: id,
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
