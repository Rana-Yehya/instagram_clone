// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_entity_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentEntityPayload _$CommentEntityPayloadFromJson(Map<String, dynamic> json) {
  return _CommentEntityPayload.fromJson(json);
}

/// @nodoc
mixin _$CommentEntityPayload {
  @JsonKey(ignore: true, name: Constants.commentID)
  String? get commentID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.comment)
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.createdAt)
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  Object get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.userID)
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.postID)
  String get postID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentEntityPayloadCopyWith<CommentEntityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEntityPayloadCopyWith<$Res> {
  factory $CommentEntityPayloadCopyWith(CommentEntityPayload value,
          $Res Function(CommentEntityPayload) then) =
      _$CommentEntityPayloadCopyWithImpl<$Res, CommentEntityPayload>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true, name: Constants.commentID) String? commentID,
      @JsonKey(name: Constants.comment) String comment,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.postID) String postID});
}

/// @nodoc
class _$CommentEntityPayloadCopyWithImpl<$Res,
        $Val extends CommentEntityPayload>
    implements $CommentEntityPayloadCopyWith<$Res> {
  _$CommentEntityPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentID = freezed,
    Object? comment = null,
    Object? createdAt = null,
    Object? userID = null,
    Object? postID = null,
  }) {
    return _then(_value.copyWith(
      commentID: freezed == commentID
          ? _value.commentID
          : commentID // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt ? _value.createdAt : createdAt,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentEntityPayloadCopyWith<$Res>
    implements $CommentEntityPayloadCopyWith<$Res> {
  factory _$$_CommentEntityPayloadCopyWith(_$_CommentEntityPayload value,
          $Res Function(_$_CommentEntityPayload) then) =
      __$$_CommentEntityPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true, name: Constants.commentID) String? commentID,
      @JsonKey(name: Constants.comment) String comment,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.postID) String postID});
}

/// @nodoc
class __$$_CommentEntityPayloadCopyWithImpl<$Res>
    extends _$CommentEntityPayloadCopyWithImpl<$Res, _$_CommentEntityPayload>
    implements _$$_CommentEntityPayloadCopyWith<$Res> {
  __$$_CommentEntityPayloadCopyWithImpl(_$_CommentEntityPayload _value,
      $Res Function(_$_CommentEntityPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentID = freezed,
    Object? comment = null,
    Object? createdAt = null,
    Object? userID = null,
    Object? postID = null,
  }) {
    return _then(_$_CommentEntityPayload(
      commentID: freezed == commentID
          ? _value.commentID
          : commentID // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt ? _value.createdAt : createdAt,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentEntityPayload extends _CommentEntityPayload {
  const _$_CommentEntityPayload(
      {@JsonKey(ignore: true, name: Constants.commentID) this.commentID,
      @JsonKey(name: Constants.comment) required this.comment,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      required this.createdAt,
      @JsonKey(name: Constants.userID) required this.userID,
      @JsonKey(name: Constants.postID) required this.postID})
      : super._();

  factory _$_CommentEntityPayload.fromJson(Map<String, dynamic> json) =>
      _$$_CommentEntityPayloadFromJson(json);

  @override
  @JsonKey(ignore: true, name: Constants.commentID)
  final String? commentID;
  @override
  @JsonKey(name: Constants.comment)
  final String comment;
  @override
  @JsonKey(name: Constants.createdAt)
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  final Object createdAt;
  @override
  @JsonKey(name: Constants.userID)
  final String userID;
  @override
  @JsonKey(name: Constants.postID)
  final String postID;

  @override
  String toString() {
    return 'CommentEntityPayload(commentID: $commentID, comment: $comment, createdAt: $createdAt, userID: $userID, postID: $postID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentEntityPayload &&
            (identical(other.commentID, commentID) ||
                other.commentID == commentID) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.postID, postID) || other.postID == postID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, commentID, comment,
      const DeepCollectionEquality().hash(createdAt), userID, postID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentEntityPayloadCopyWith<_$_CommentEntityPayload> get copyWith =>
      __$$_CommentEntityPayloadCopyWithImpl<_$_CommentEntityPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentEntityPayloadToJson(
      this,
    );
  }
}

abstract class _CommentEntityPayload extends CommentEntityPayload {
  const factory _CommentEntityPayload(
          {@JsonKey(ignore: true, name: Constants.commentID)
          final String? commentID,
          @JsonKey(name: Constants.comment) required final String comment,
          @JsonKey(name: Constants.createdAt)
          @JsonKey(
              fromJson: ServerTimestampConverter.fromJson,
              toJson: ServerTimestampConverter.toJson)
          required final Object createdAt,
          @JsonKey(name: Constants.userID) required final String userID,
          @JsonKey(name: Constants.postID) required final String postID}) =
      _$_CommentEntityPayload;
  const _CommentEntityPayload._() : super._();

  factory _CommentEntityPayload.fromJson(Map<String, dynamic> json) =
      _$_CommentEntityPayload.fromJson;

  @override
  @JsonKey(ignore: true, name: Constants.commentID)
  String? get commentID;
  @override
  @JsonKey(name: Constants.comment)
  String get comment;
  @override
  @JsonKey(name: Constants.createdAt)
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  Object get createdAt;
  @override
  @JsonKey(name: Constants.userID)
  String get userID;
  @override
  @JsonKey(name: Constants.postID)
  String get postID;
  @override
  @JsonKey(ignore: true)
  _$$_CommentEntityPayloadCopyWith<_$_CommentEntityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
