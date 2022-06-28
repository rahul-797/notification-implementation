// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DatabaseModel _$$_DatabaseModelFromJson(Map<String, dynamic> json) =>
    _$_DatabaseModel(
      name: json['name'] as String,
      game: json['game'] as String,
      mission: json['mission'] as int,
    );

Map<String, dynamic> _$$_DatabaseModelToJson(_$_DatabaseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'game': instance.game,
      'mission': instance.mission,
    };
