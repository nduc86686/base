import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'source.dart';

@JsonSerializable(explicitToJson: true)
class Article extends Equatable {
  @JsonKey(defaultValue: 0)
  final int? id;
  final Source? source;
  @JsonKey(defaultValue: '')
  final String? author;
  @JsonKey(defaultValue: '')
  final String? title;
  @JsonKey(defaultValue: '')
  final String? description;
  @JsonKey(defaultValue: '')
  final String? url;
  @JsonKey(defaultValue: '')
  final String? urlToImage;
  @JsonKey(defaultValue: '')
  final String? publishedAt;
  @JsonKey(defaultValue: '')
  final String? content;

  const Article({
    required this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object> get props {
    return [
      id!,
      source!,
      author!,
      title!,
      description!,
      url!,
      urlToImage!,
      publishedAt!,
      content!,
    ];
  }

  @override
  bool get stringify => true;
}
