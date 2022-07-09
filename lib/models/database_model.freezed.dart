// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'database_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DatabaseModel _$DatabaseModelFromJson(Map<String, dynamic> json) {
  return _DatabaseModel.fromJson(json);
}

/// @nodoc
mixin _$DatabaseModel {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get game => throw _privateConstructorUsedError;
  set game(String value) => throw _privateConstructorUsedError;
  int get mission => throw _privateConstructorUsedError;
  set mission(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatabaseModelCopyWith<DatabaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseModelCopyWith<$Res> {
  factory $DatabaseModelCopyWith(
          DatabaseModel value, $Res Function(DatabaseModel) then) =
      _$DatabaseModelCopyWithImpl<$Res>;
  $Res call({String name, String game, int mission});
}

/// @nodoc
class _$DatabaseModelCopyWithImpl<$Res>
    implements $DatabaseModelCopyWith<$Res> {
  _$DatabaseModelCopyWithImpl(this._value, this._then);

  final DatabaseModel _value;
  // ignore: unused_field
  final $Res Function(DatabaseModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? game = freezed,
    Object? mission = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      mission: mission == freezed
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DatabaseModelCopyWith<$Res>
    implements $DatabaseModelCopyWith<$Res> {
  factory _$$_DatabaseModelCopyWith(
          _$_DatabaseModel value, $Res Function(_$_DatabaseModel) then) =
      __$$_DatabaseModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, String game, int mission});
}

/// @nodoc
class __$$_DatabaseModelCopyWithImpl<$Res>
    extends _$DatabaseModelCopyWithImpl<$Res>
    implements _$$_DatabaseModelCopyWith<$Res> {
  __$$_DatabaseModelCopyWithImpl(
      _$_DatabaseModel _value, $Res Function(_$_DatabaseModel) _then)
      : super(_value, (v) => _then(v as _$_DatabaseModel));

  @override
  _$_DatabaseModel get _value => super._value as _$_DatabaseModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? game = freezed,
    Object? mission = freezed,
  }) {
    return _then(_$_DatabaseModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      game: game == freezed
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as String,
      mission: mission == freezed
          ? _value.mission
          : mission // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DatabaseModel implements _DatabaseModel {
  _$_DatabaseModel(
      {required this.name, required this.game, required this.mission});

  factory _$_DatabaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_DatabaseModelFromJson(json);

  @override
  String name;
  @override
  String game;
  @override
  int mission;

  @override
  String toString() {
    return 'DatabaseModel(name: $name, game: $game, mission: $mission)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_DatabaseModelCopyWith<_$_DatabaseModel> get copyWith =>
      __$$_DatabaseModelCopyWithImpl<_$_DatabaseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatabaseModelToJson(this);
  }
}

abstract class _DatabaseModel implements DatabaseModel {
  factory _DatabaseModel(
      {required String name,
      required String game,
      required int mission}) = _$_DatabaseModel;

  factory _DatabaseModel.fromJson(Map<String, dynamic> json) =
      _$_DatabaseModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get game => throw _privateConstructorUsedError;
  @override
  int get mission => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DatabaseModelCopyWith<_$_DatabaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
