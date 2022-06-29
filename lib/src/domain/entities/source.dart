import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

///model
@JsonSerializable()
class Source extends Equatable {
  @JsonKey(defaultValue: '')
  final String? id;
  @JsonKey(defaultValue: '')
  final String? name;

  const Source({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id!, name!];

  @override
  bool get stringify => true;
}
