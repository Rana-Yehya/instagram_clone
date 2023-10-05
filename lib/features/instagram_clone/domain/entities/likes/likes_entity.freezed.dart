// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'likes_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikesEntity {
  String get postID => throw _privateConstructorUsedError;
  UniqueId get likedBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikesEntityCopyWith<LikesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikesEntityCopyWith<$Res> {
  factory $LikesEntityCopyWith(
          LikesEntity value, $Res Function(LikesEntity) then) =
      _$LikesEntityCopyWithImpl<$Res, LikesEntity>;
  @useResult
  $Res call({String postID, UniqueId likedBy});
}

/// @nodoc
class _$LikesEntityCopyWithImpl<$Res, $Val extends LikesEntity>
    implements $LikesEntityCopyWith<$Res> {
  _$LikesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? likedBy = null,
  }) {
    return _then(_value.copyWith(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      likedBy: null == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikesEntityCopyWith<$Res>
    implements $LikesEntityCopyWith<$Res> {
  factory _$$_LikesEntityCopyWith(
          _$_LikesEntity value, $Res Function(_$_LikesEntity) then) =
      __$$_LikesEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postID, UniqueId likedBy});
}

/// @nodoc
class __$$_LikesEntityCopyWithImpl<$Res>
    extends _$LikesEntityCopyWithImpl<$Res, _$_LikesEntity>
    implements _$$_LikesEntityCopyWith<$Res> {
  __$$_LikesEntityCopyWithImpl(
      _$_LikesEntity _value, $Res Function(_$_LikesEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? likedBy = null,
  }) {
    return _then(_$_LikesEntity(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      likedBy: null == likedBy
          ? _value.likedBy
          : likedBy // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_LikesEntity implements _LikesEntity {
  const _$_LikesEntity({required this.postID, required this.likedBy});

  @override
  final String postID;
  @override
  final UniqueId likedBy;

  @override
  String toString() {
    return 'LikesEntity(postID: $postID, likedBy: $likedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikesEntity &&
            (identical(other.postID, postID) || other.postID == postID) &&
            (identical(other.likedBy, likedBy) || other.likedBy == likedBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postID, likedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikesEntityCopyWith<_$_LikesEntity> get copyWith =>
      __$$_LikesEntityCopyWithImpl<_$_LikesEntity>(this, _$identity);
}

abstract class _LikesEntity implements LikesEntity {
  const factory _LikesEntity(
      {required final String postID,
      required final UniqueId likedBy}) = _$_LikesEntity;

  @override
  String get postID;
  @override
  UniqueId get likedBy;
  @override
  @JsonKey(ignore: true)
  _$$_LikesEntityCopyWith<_$_LikesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
