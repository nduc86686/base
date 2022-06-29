import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/source.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel extends Source {
  const SourceModel({
    required String id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
