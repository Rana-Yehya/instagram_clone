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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LikesEntityPayload _$LikesEntityPayloadFromJson(Map<String, dynamic> json) {
  return _LikesEntityPayload.fromJson(json);
}

/// @nodoc
mixin _$LikesEntityPayload {
  @JsonKey(name: Constants.postID)
  String get postID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.userID)
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.createdAt)
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  Object get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikesEntityPayloadCopyWith<LikesEntityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikesEntityPayloadCopyWith<$Res> {
  factory $LikesEntityPayloadCopyWith(
          LikesEntityPayload value, $Res Function(LikesEntityPayload) then) =
      _$LikesEntityPayloadCopyWithImpl<$Res, LikesEntityPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: Constants.postID) String postID,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt});
}

/// @nodoc
class _$LikesEntityPayloadCopyWithImpl<$Res, $Val extends LikesEntityPayload>
    implements $LikesEntityPayloadCopyWith<$Res> {
  _$LikesEntityPayloadCopyWithImpl(this._value, this._then);

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
abstract class _$$LikesEntityPayloadImplCopyWith<$Res>
    implements $LikesEntityPayloadCopyWith<$Res> {
  factory _$$LikesEntityPayloadImplCopyWith(_$LikesEntityPayloadImpl value,
          $Res Function(_$LikesEntityPayloadImpl) then) =
      __$$LikesEntityPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Constants.postID) String postID,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt});
}

/// @nodoc
class __$$LikesEntityPayloadImplCopyWithImpl<$Res>
    extends _$LikesEntityPayloadCopyWithImpl<$Res, _$LikesEntityPayloadImpl>
    implements _$$LikesEntityPayloadImplCopyWith<$Res> {
  __$$LikesEntityPayloadImplCopyWithImpl(_$LikesEntityPayloadImpl _value,
      $Res Function(_$LikesEntityPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? userID = null,
    Object? createdAt = null,
  }) {
    return _then(_$LikesEntityPayloadImpl(
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
class _$LikesEntityPayloadImpl extends _LikesEntityPayload {
  const _$LikesEntityPayloadImpl(
      {@JsonKey(name: Constants.postID) required this.postID,
      @JsonKey(name: Constants.userID) required this.userID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      required this.createdAt})
      : super._();

  factory _$LikesEntityPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LikesEntityPayloadImplFromJson(json);

  @override
  @JsonKey(name: Constants.postID)
  final String postID;
  @override
  @JsonKey(name: Constants.userID)
  final String userID;
  @override
  @JsonKey(name: Constants.createdAt)
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  final Object createdAt;

  @override
  String toString() {
    return 'LikesEntityPayload(postID: $postID, userID: $userID, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikesEntityPayloadImpl &&
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
  _$$LikesEntityPayloadImplCopyWith<_$LikesEntityPayloadImpl> get copyWith =>
      __$$LikesEntityPayloadImplCopyWithImpl<_$LikesEntityPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LikesEntityPayloadImplToJson(
      this,
    );
  }
}

abstract class _LikesEntityPayload extends LikesEntityPayload {
  const factory _LikesEntityPayload(
      {@JsonKey(name: Constants.postID) required final String postID,
      @JsonKey(name: Constants.userID) required final String userID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      required final Object createdAt}) = _$LikesEntityPayloadImpl;
  const _LikesEntityPayload._() : super._();

  factory _LikesEntityPayload.fromJson(Map<String, dynamic> json) =
      _$LikesEntityPayloadImpl.fromJson;

  @override
  @JsonKey(name: Constants.postID)
  String get postID;
  @override
  @JsonKey(name: Constants.userID)
  String get userID;
  @override
  @JsonKey(name: Constants.createdAt)
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  Object get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$LikesEntityPayloadImplCopyWith<_$LikesEntityPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
