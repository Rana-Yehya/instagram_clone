// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostDetailsEntity {
  String get postID => throw _privateConstructorUsedError;
  bool? get sortByCreateAt => throw _privateConstructorUsedError;
  DateSorting? get dateSorting => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostDetailsEntityCopyWith<PostDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailsEntityCopyWith<$Res> {
  factory $PostDetailsEntityCopyWith(
          PostDetailsEntity value, $Res Function(PostDetailsEntity) then) =
      _$PostDetailsEntityCopyWithImpl<$Res, PostDetailsEntity>;
  @useResult
  $Res call(
      {String postID,
      bool? sortByCreateAt,
      DateSorting? dateSorting,
      int? limit});
}

/// @nodoc
class _$PostDetailsEntityCopyWithImpl<$Res, $Val extends PostDetailsEntity>
    implements $PostDetailsEntityCopyWith<$Res> {
  _$PostDetailsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? sortByCreateAt = freezed,
    Object? dateSorting = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      sortByCreateAt: freezed == sortByCreateAt
          ? _value.sortByCreateAt
          : sortByCreateAt // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateSorting: freezed == dateSorting
          ? _value.dateSorting
          : dateSorting // ignore: cast_nullable_to_non_nullable
              as DateSorting?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostDetailsEntityCopyWith<$Res>
    implements $PostDetailsEntityCopyWith<$Res> {
  factory _$$_PostDetailsEntityCopyWith(_$_PostDetailsEntity value,
          $Res Function(_$_PostDetailsEntity) then) =
      __$$_PostDetailsEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postID,
      bool? sortByCreateAt,
      DateSorting? dateSorting,
      int? limit});
}

/// @nodoc
class __$$_PostDetailsEntityCopyWithImpl<$Res>
    extends _$PostDetailsEntityCopyWithImpl<$Res, _$_PostDetailsEntity>
    implements _$$_PostDetailsEntityCopyWith<$Res> {
  __$$_PostDetailsEntityCopyWithImpl(
      _$_PostDetailsEntity _value, $Res Function(_$_PostDetailsEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postID = null,
    Object? sortByCreateAt = freezed,
    Object? dateSorting = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$_PostDetailsEntity(
      postID: null == postID
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      sortByCreateAt: freezed == sortByCreateAt
          ? _value.sortByCreateAt
          : sortByCreateAt // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateSorting: freezed == dateSorting
          ? _value.dateSorting
          : dateSorting // ignore: cast_nullable_to_non_nullable
              as DateSorting?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PostDetailsEntity extends _PostDetailsEntity {
  const _$_PostDetailsEntity(
      {required this.postID,
      this.sortByCreateAt = true,
      this.dateSorting = DateSorting.newestOnTop,
      this.limit = null})
      : super._();

  @override
  final String postID;
  @override
  @JsonKey()
  final bool? sortByCreateAt;
  @override
  @JsonKey()
  final DateSorting? dateSorting;
  @override
  @JsonKey()
  final int? limit;

  @override
  String toString() {
    return 'PostDetailsEntity(postID: $postID, sortByCreateAt: $sortByCreateAt, dateSorting: $dateSorting, limit: $limit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostDetailsEntity &&
            (identical(other.postID, postID) || other.postID == postID) &&
            (identical(other.sortByCreateAt, sortByCreateAt) ||
                other.sortByCreateAt == sortByCreateAt) &&
            (identical(other.dateSorting, dateSorting) ||
                other.dateSorting == dateSorting) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, postID, sortByCreateAt, dateSorting, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostDetailsEntityCopyWith<_$_PostDetailsEntity> get copyWith =>
      __$$_PostDetailsEntityCopyWithImpl<_$_PostDetailsEntity>(
          this, _$identity);
}

abstract class _PostDetailsEntity extends PostDetailsEntity {
  const factory _PostDetailsEntity(
      {required final String postID,
      final bool? sortByCreateAt,
      final DateSorting? dateSorting,
      final int? limit}) = _$_PostDetailsEntity;
  const _PostDetailsEntity._() : super._();

  @override
  String get postID;
  @override
  bool? get sortByCreateAt;
  @override
  DateSorting? get dateSorting;
  @override
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$_PostDetailsEntityCopyWith<_$_PostDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
