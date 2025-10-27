// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostEntity {
  String get postID => throw _privateConstructorUsedError;
  UniqueId get userID => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get thumbnailURL => throw _privateConstructorUsedError;
  String get fileURL => throw _privateConstructorUsedError;
  ImageOrVideo get imageOrVideo => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  String get thumbnailStorageID => throw _privateConstructorUsedError;
  String get originalFileStorageID => throw _privateConstructorUsedError;
  Map<PostSetting, bool> get postSettings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostEntityCopyWith<PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEntityCopyWith<$Res> {
  factory $PostEntityCopyWith(
          PostEntity value, $Res Function(PostEntity) then) =
      _$PostEntityCopyWithImpl<$Res, PostEntity>;
  @useResult
  $Res call(
      {String postID,
      UniqueId userID,
      String message,
      DateTime? createdAt,
      String thumbnailURL,
      String fileURL,
      ImageOrVideo imageOrVideo,
      String fileName,
      double aspectRatio,
      String thumbnailStorageID,
      String originalFileStorageID,
      Map<PostSetting, bool> postSettings});
}

/// @nodoc
class _$PostEntityCopyWithImpl<$Res, $Val extends PostEntity>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? userID = null,
    Object? message = null,
    Object? createdAt = freezed,
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
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as ImageOrVideo,
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
abstract class _$$PostEntityImplCopyWith<$Res>
    implements $PostEntityCopyWith<$Res> {
  factory _$$PostEntityImplCopyWith(
          _$PostEntityImpl value, $Res Function(_$PostEntityImpl) then) =
      __$$PostEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postID,
      UniqueId userID,
      String message,
      DateTime? createdAt,
      String thumbnailURL,
      String fileURL,
      ImageOrVideo imageOrVideo,
      String fileName,
      double aspectRatio,
      String thumbnailStorageID,
      String originalFileStorageID,
      Map<PostSetting, bool> postSettings});
}

/// @nodoc
class __$$PostEntityImplCopyWithImpl<$Res>
    extends _$PostEntityCopyWithImpl<$Res, _$PostEntityImpl>
    implements _$$PostEntityImplCopyWith<$Res> {
  __$$PostEntityImplCopyWithImpl(
      _$PostEntityImpl _value, $Res Function(_$PostEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? userID = null,
    Object? message = null,
    Object? createdAt = freezed,
    Object? thumbnailURL = null,
    Object? fileURL = null,
    Object? imageOrVideo = null,
    Object? fileName = null,
    Object? aspectRatio = null,
    Object? thumbnailStorageID = null,
    Object? originalFileStorageID = null,
    Object? postSettings = null,
  }) {
    return _then(_$PostEntityImpl(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as ImageOrVideo,
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

class _$PostEntityImpl extends _PostEntity {
  const _$PostEntityImpl(
      {required this.postID,
      required this.userID,
      required this.message,
      required this.createdAt,
      required this.thumbnailURL,
      required this.fileURL,
      required this.imageOrVideo,
      required this.fileName,
      required this.aspectRatio,
      required this.thumbnailStorageID,
      required this.originalFileStorageID,
      required final Map<PostSetting, bool> postSettings})
      : _postSettings = postSettings,
        super._();

  @override
  final String postID;
  @override
  final UniqueId userID;
  @override
  final String message;
  @override
  final DateTime? createdAt;
  @override
  final String thumbnailURL;
  @override
  final String fileURL;
  @override
  final ImageOrVideo imageOrVideo;
  @override
  final String fileName;
  @override
  final double aspectRatio;
  @override
  final String thumbnailStorageID;
  @override
  final String originalFileStorageID;
  final Map<PostSetting, bool> _postSettings;
  @override
  Map<PostSetting, bool> get postSettings {
    if (_postSettings is EqualUnmodifiableMapView) return _postSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_postSettings);
  }

  @override
  String toString() {
    return 'PostEntity(postID: $postID, userID: $userID, message: $message, createdAt: $createdAt, thumbnailURL: $thumbnailURL, fileURL: $fileURL, imageOrVideo: $imageOrVideo, fileName: $fileName, aspectRatio: $aspectRatio, thumbnailStorageID: $thumbnailStorageID, originalFileStorageID: $originalFileStorageID, postSettings: $postSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostEntityImpl &&
            (identical(other.postID, postID) || other.postID == postID) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType,
      postID,
      userID,
      message,
      createdAt,
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
  _$$PostEntityImplCopyWith<_$PostEntityImpl> get copyWith =>
      __$$PostEntityImplCopyWithImpl<_$PostEntityImpl>(this, _$identity);
}

abstract class _PostEntity extends PostEntity {
  const factory _PostEntity(
      {required final String postID,
      required final UniqueId userID,
      required final String message,
      required final DateTime? createdAt,
      required final String thumbnailURL,
      required final String fileURL,
      required final ImageOrVideo imageOrVideo,
      required final String fileName,
      required final double aspectRatio,
      required final String thumbnailStorageID,
      required final String originalFileStorageID,
      required final Map<PostSetting, bool> postSettings}) = _$PostEntityImpl;
  const _PostEntity._() : super._();

  @override
  String get postID;
  @override
  UniqueId get userID;
  @override
  String get message;
  @override
  DateTime? get createdAt;
  @override
  String get thumbnailURL;
  @override
  String get fileURL;
  @override
  ImageOrVideo get imageOrVideo;
  @override
  String get fileName;
  @override
  double get aspectRatio;
  @override
  String get thumbnailStorageID;
  @override
  String get originalFileStorageID;
  @override
  Map<PostSetting, bool> get postSettings;
  @override
  @JsonKey(ignore: true)
  _$$PostEntityImplCopyWith<_$PostEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
