import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_model.freezed.dart';
part 'database_model.g.dart';

@freezed
class DatabaseModel with _$DatabaseModel {
  const factory DatabaseModel({
    required String name,
    required String game,
    required int mission,
  }) = _DatabaseModel;

  factory DatabaseModel.fromJson(Map<String, Object?> json)
  => _$DatabaseModelFromJson(json);
}