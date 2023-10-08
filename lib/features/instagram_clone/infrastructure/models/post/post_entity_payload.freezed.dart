// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostEntityPayload _$PostEntityPayloadFromJson(Map<String, dynamic> json) {
  return _PostEntityPayload.fromJson(json);
}

/// @nodoc
mixin _$PostEntityPayload {
  @JsonKey(name: Constants.postID)
  String? get postID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.createdAt)
  @JsonKey(
      fromJson: ServerTimestampConverter.fromJson,
      toJson: ServerTimestampConverter.toJson)
  Object get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.userID)
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.message)
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.thumbnailURL)
  String get thumbnailURL => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.fileURL)
  String get fileURL => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.imageOrVideo)
  bool get imageOrVideo => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.fileName)
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.aspectRatio)
  double get aspectRatio => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.thumbnailStorageID)
  String get thumbnailStorageID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.originalFileStorageID)
  String get originalFileStorageID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.postSettings)
  Map<PostSetting, bool> get postSettings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostEntityPayloadCopyWith<PostEntityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEntityPayloadCopyWith<$Res> {
  factory $PostEntityPayloadCopyWith(
          PostEntityPayload value, $Res Function(PostEntityPayload) then) =
      _$PostEntityPayloadCopyWithImpl<$Res, PostEntityPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: Constants.postID) String? postID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.message) String message,
      @JsonKey(name: Constants.thumbnailURL) String thumbnailURL,
      @JsonKey(name: Constants.fileURL) String fileURL,
      @JsonKey(name: Constants.imageOrVideo) bool imageOrVideo,
      @JsonKey(name: Constants.fileName) String fileName,
      @JsonKey(name: Constants.aspectRatio) double aspectRatio,
      @JsonKey(name: Constants.thumbnailStorageID) String thumbnailStorageID,
      @JsonKey(name: Constants.originalFileStorageID)
      String originalFileStorageID,
      @JsonKey(name: Constants.postSettings)
      Map<PostSetting, bool> postSettings});
}

/// @nodoc
class _$PostEntityPayloadCopyWithImpl<$Res, $Val extends PostEntityPayload>
    implements $PostEntityPayloadCopyWith<$Res> {
  _$PostEntityPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = freezed,
    Object? createdAt = null,
    Object? userID = null,
    Object? message = null,
    Object? thumbnailURL = null,
    Object? fileURL = null,
    Object? imageOrVideo = null,
    Object? fileName = null,
    Object? aspectRatio = null,
    Object? thumbnailStorageID = null,
    Object? originalFileStorageID = null,
    Object? postSettings = null,
  }) {
    return _then(_value.copyWith(
      postID: freezed == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt ? _value.createdAt : createdAt,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailURL: null == thumbnailURL
          ? _value.thumbnailURL
          : thumbnailURL // ignore: cast_nullable_to_non_nullable
              as String,
      fileURL: null == fileURL
          ? _value.fileURL
          : fileURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageOrVideo: null == imageOrVideo
          ? _value.imageOrVideo
          : imageOrVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      thumbnailStorageID: null == thumbnailStorageID
          ? _value.thumbnailStorageID
          : thumbnailStorageID // ignore: cast_nullable_to_non_nullable
              as String,
      originalFileStorageID: null == originalFileStorageID
          ? _value.originalFileStorageID
          : originalFileStorageID // ignore: cast_nullable_to_non_nullable
              as String,
      postSettings: null == postSettings
          ? _value.postSettings
          : postSettings // ignore: cast_nullable_to_non_nullable
              as Map<PostSetting, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostEntityPayloadCopyWith<$Res>
    implements $PostEntityPayloadCopyWith<$Res> {
  factory _$$_PostEntityPayloadCopyWith(_$_PostEntityPayload value,
          $Res Function(_$_PostEntityPayload) then) =
      __$$_PostEntityPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Constants.postID) String? postID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      Object createdAt,
      @JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.message) String message,
      @JsonKey(name: Constants.thumbnailURL) String thumbnailURL,
      @JsonKey(name: Constants.fileURL) String fileURL,
      @JsonKey(name: Constants.imageOrVideo) bool imageOrVideo,
      @JsonKey(name: Constants.fileName) String fileName,
      @JsonKey(name: Constants.aspectRatio) double aspectRatio,
      @JsonKey(name: Constants.thumbnailStorageID) String thumbnailStorageID,
      @JsonKey(name: Constants.originalFileStorageID)
      String originalFileStorageID,
      @JsonKey(name: Constants.postSettings)
      Map<PostSetting, bool> postSettings});
}

/// @nodoc
class __$$_PostEntityPayloadCopyWithImpl<$Res>
    extends _$PostEntityPayloadCopyWithImpl<$Res, _$_PostEntityPayload>
    implements _$$_PostEntityPayloadCopyWith<$Res> {
  __$$_PostEntityPayloadCopyWithImpl(
      _$_PostEntityPayload _value, $Res Function(_$_PostEntityPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = freezed,
    Object? createdAt = null,
    Object? userID = null,
    Object? message = null,
    Object? thumbnailURL = null,
    Object? fileURL = null,
    Object? imageOrVideo = null,
    Object? fileName = null,
    Object? aspectRatio = null,
    Object? thumbnailStorageID = null,
    Object? originalFileStorageID = null,
    Object? postSettings = null,
  }) {
    return _then(_$_PostEntityPayload(
      postID: freezed == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt ? _value.createdAt : createdAt,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailURL: null == thumbnailURL
          ? _value.thumbnailURL
          : thumbnailURL // ignore: cast_nullable_to_non_nullable
              as String,
      fileURL: null == fileURL
          ? _value.fileURL
          : fileURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageOrVideo: null == imageOrVideo
          ? _value.imageOrVideo
          : imageOrVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      thumbnailStorageID: null == thumbnailStorageID
          ? _value.thumbnailStorageID
          : thumbnailStorageID // ignore: cast_nullable_to_non_nullable
              as String,
      originalFileStorageID: null == originalFileStorageID
          ? _value.originalFileStorageID
          : originalFileStorageID // ignore: cast_nullable_to_non_nullable
              as String,
      postSettings: null == postSettings
          ? _value._postSettings
          : postSettings // ignore: cast_nullable_to_non_nullable
              as Map<PostSetting, bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostEntityPayload extends _PostEntityPayload {
  const _$_PostEntityPayload(
      {@JsonKey(name: Constants.postID) this.postID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      required this.createdAt,
      @JsonKey(name: Constants.userID) required this.userID,
      @JsonKey(name: Constants.message) required this.message,
      @JsonKey(name: Constants.thumbnailURL) required this.thumbnailURL,
      @JsonKey(name: Constants.fileURL) required this.fileURL,
      @JsonKey(name: Constants.imageOrVideo) required this.imageOrVideo,
      @JsonKey(name: Constants.fileName) required this.fileName,
      @JsonKey(name: Constants.aspectRatio) required this.aspectRatio,
      @JsonKey(name: Constants.thumbnailStorageID)
      required this.thumbnailStorageID,
      @JsonKey(name: Constants.originalFileStorageID)
      required this.originalFileStorageID,
      @JsonKey(name: Constants.postSettings)
      required final Map<PostSetting, bool> postSettings})
      : _postSettings = postSettings,
        super._();

  factory _$_PostEntityPayload.fromJson(Map<String, dynamic> json) =>
      _$$_PostEntityPayloadFromJson(json);

  @override
  @JsonKey(name: Constants.postID)
  final String? postID;
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
  @JsonKey(name: Constants.message)
  final String message;
  @override
  @JsonKey(name: Constants.thumbnailURL)
  final String thumbnailURL;
  @override
  @JsonKey(name: Constants.fileURL)
  final String fileURL;
  @override
  @JsonKey(name: Constants.imageOrVideo)
  final bool imageOrVideo;
  @override
  @JsonKey(name: Constants.fileName)
  final String fileName;
  @override
  @JsonKey(name: Constants.aspectRatio)
  final double aspectRatio;
  @override
  @JsonKey(name: Constants.thumbnailStorageID)
  final String thumbnailStorageID;
  @override
  @JsonKey(name: Constants.originalFileStorageID)
  final String originalFileStorageID;
  final Map<PostSetting, bool> _postSettings;
  @override
  @JsonKey(name: Constants.postSettings)
  Map<PostSetting, bool> get postSettings {
    if (_postSettings is EqualUnmodifiableMapView) return _postSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postSettings);
  }

  @override
  String toString() {
    return 'PostEntityPayload(postID: $postID, createdAt: $createdAt, userID: $userID, message: $message, thumbnailURL: $thumbnailURL, fileURL: $fileURL, imageOrVideo: $imageOrVideo, fileName: $fileName, aspectRatio: $aspectRatio, thumbnailStorageID: $thumbnailStorageID, originalFileStorageID: $originalFileStorageID, postSettings: $postSettings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostEntityPayload &&
            (identical(other.postID, postID) || other.postID == postID) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.thumbnailURL, thumbnailURL) ||
                other.thumbnailURL == thumbnailURL) &&
            (identical(other.fileURL, fileURL) || other.fileURL == fileURL) &&
            (identical(other.imageOrVideo, imageOrVideo) ||
                other.imageOrVideo == imageOrVideo) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.thumbnailStorageID, thumbnailStorageID) ||
                other.thumbnailStorageID == thumbnailStorageID) &&
            (identical(other.originalFileStorageID, originalFileStorageID) ||
                other.originalFileStorageID == originalFileStorageID) &&
            const DeepCollectionEquality()
                .equals(other._postSettings, _postSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postID,
      const DeepCollectionEquality().hash(createdAt),
      userID,
      message,
      thumbnailURL,
      fileURL,
      imageOrVideo,
      fileName,
      aspectRatio,
      thumbnailStorageID,
      originalFileStorageID,
      const DeepCollectionEquality().hash(_postSettings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostEntityPayloadCopyWith<_$_PostEntityPayload> get copyWith =>
      __$$_PostEntityPayloadCopyWithImpl<_$_PostEntityPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostEntityPayloadToJson(
      this,
    );
  }
}

abstract class _PostEntityPayload extends PostEntityPayload {
  const factory _PostEntityPayload(
      {@JsonKey(name: Constants.postID) final String? postID,
      @JsonKey(name: Constants.createdAt)
      @JsonKey(
          fromJson: ServerTimestampConverter.fromJson,
          toJson: ServerTimestampConverter.toJson)
      required final Object createdAt,
      @JsonKey(name: Constants.userID) required final String userID,
      @JsonKey(name: Constants.message) required final String message,
      @JsonKey(name: Constants.thumbnailURL) required final String thumbnailURL,
      @JsonKey(name: Constants.fileURL) required final String fileURL,
      @JsonKey(name: Constants.imageOrVideo) required final bool imageOrVideo,
      @JsonKey(name: Constants.fileName) required final String fileName,
      @JsonKey(name: Constants.aspectRatio) required final double aspectRatio,
      @JsonKey(name: Constants.thumbnailStorageID)
      required final String thumbnailStorageID,
      @JsonKey(name: Constants.originalFileStorageID)
      required final String originalFileStorageID,
      @JsonKey(name: Constants.postSettings)
      required final Map<PostSetting, bool>
          postSettings}) = _$_PostEntityPayload;
  const _PostEntityPayload._() : super._();

  factory _PostEntityPayload.fromJson(Map<String, dynamic> json) =
      _$_PostEntityPayload.fromJson;

  @override
  @JsonKey(name: Constants.postID)
  String? get postID;
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
  @JsonKey(name: Constants.message)
  String get message;
  @override
  @JsonKey(name: Constants.thumbnailURL)
  String get thumbnailURL;
  @override
  @JsonKey(name: Constants.fileURL)
  String get fileURL;
  @override
  @JsonKey(name: Constants.imageOrVideo)
  bool get imageOrVideo;
  @override
  @JsonKey(name: Constants.fileName)
  String get fileName;
  @override
  @JsonKey(name: Constants.aspectRatio)
  double get aspectRatio;
  @override
  @JsonKey(name: Constants.thumbnailStorageID)
  String get thumbnailStorageID;
  @override
  @JsonKey(name: Constants.originalFileStorageID)
  String get originalFileStorageID;
  @override
  @JsonKey(name: Constants.postSettings)
  Map<PostSetting, bool> get postSettings;
  @override
  @JsonKey(ignore: true)
  _$$_PostEntityPayloadCopyWith<_$_PostEntityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
