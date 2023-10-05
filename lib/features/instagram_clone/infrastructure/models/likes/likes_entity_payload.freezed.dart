// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'likes_entity_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikestEntityPayload _$LikestEntityPayloadFromJson(Map<String, dynamic> json) {
  return _LikestEntityPayload.fromJson(json);
}

/// @nodoc
mixin _$LikestEntityPayload {
  @JsonKey(name: Constants.postID)
  String get postID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.userID)
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  Object get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikestEntityPayloadCopyWith<LikestEntityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikestEntityPayloadCopyWith<$Res> {
  factory $LikestEntityPayloadCopyWith(
          LikestEntityPayload value, $Res Function(LikestEntityPayload) then) =
      _$LikestEntityPayloadCopyWithImpl<$Res, LikestEntityPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: Constants.postID) String postID,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt});
}

/// @nodoc
class _$LikestEntityPayloadCopyWithImpl<$Res, $Val extends LikestEntityPayload>
    implements $LikestEntityPayloadCopyWith<$Res> {
  _$LikestEntityPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? userID = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt ? _value.createdAt : createdAt,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikestEntityPayloadCopyWith<$Res>
    implements $LikestEntityPayloadCopyWith<$Res> {
  factory _$$_LikestEntityPayloadCopyWith(_$_LikestEntityPayload value,
          $Res Function(_$_LikestEntityPayload) then) =
      __$$_LikestEntityPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Constants.postID) String postID,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt});
}

/// @nodoc
class __$$_LikestEntityPayloadCopyWithImpl<$Res>
    extends _$LikestEntityPayloadCopyWithImpl<$Res, _$_LikestEntityPayload>
    implements _$$_LikestEntityPayloadCopyWith<$Res> {
  __$$_LikestEntityPayloadCopyWithImpl(_$_LikestEntityPayload _value,
      $Res Function(_$_LikestEntityPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? userID = null,
    Object? createdAt = null,
  }) {
    return _then(_$_LikestEntityPayload(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt ? _value.createdAt : createdAt,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikestEntityPayload extends _LikestEntityPayload {
  const _$_LikestEntityPayload(
      {@JsonKey(name: Constants.postID) required this.postID,
      @JsonKey(name: Constants.userID) required this.userID,
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      required this.createdAt})
      : super._();

  factory _$_LikestEntityPayload.fromJson(Map<String, dynamic> json) =>
      _$$_LikestEntityPayloadFromJson(json);

  @override
  @JsonKey(name: Constants.postID)
  final String postID;
  @override
  @JsonKey(name: Constants.userID)
  final String userID;
  @override
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  final Object createdAt;

  @override
  String toString() {
    return 'LikestEntityPayload(postID: $postID, userID: $userID, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikestEntityPayload &&
            (identical(other.postID, postID) || other.postID == postID) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postID, userID,
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikestEntityPayloadCopyWith<_$_LikestEntityPayload> get copyWith =>
      __$$_LikestEntityPayloadCopyWithImpl<_$_LikestEntityPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikestEntityPayloadToJson(
      this,
    );
  }
}

abstract class _LikestEntityPayload extends LikestEntityPayload {
  const factory _LikestEntityPayload(
      {@JsonKey(name: Constants.postID) required final String postID,
      @JsonKey(name: Constants.userID) required final String userID,
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      required final Object createdAt}) = _$_LikestEntityPayload;
  const _LikestEntityPayload._() : super._();

  factory _LikestEntityPayload.fromJson(Map<String, dynamic> json) =
      _$_LikestEntityPayload.fromJson;

  @override
  @JsonKey(name: Constants.postID)
  String get postID;
  @override
  @JsonKey(name: Constants.userID)
  String get userID;
  @override
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  Object get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_LikestEntityPayloadCopyWith<_$_LikestEntityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
