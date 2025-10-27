// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAuthEntity {
  UniqueId get userID => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAuthEntityCopyWith<UserAuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthEntityCopyWith<$Res> {
  factory $UserAuthEntityCopyWith(
          UserAuthEntity value, $Res Function(UserAuthEntity) then) =
      _$UserAuthEntityCopyWithImpl<$Res, UserAuthEntity>;
  @useResult
  $Res call({UniqueId userID, String? email, String? displayName});
}

/// @nodoc
class _$UserAuthEntityCopyWithImpl<$Res, $Val extends UserAuthEntity>
    implements $UserAuthEntityCopyWith<$Res> {
  _$UserAuthEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? email = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAuthEntityImplCopyWith<$Res>
    implements $UserAuthEntityCopyWith<$Res> {
  factory _$$UserAuthEntityImplCopyWith(_$UserAuthEntityImpl value,
          $Res Function(_$UserAuthEntityImpl) then) =
      __$$UserAuthEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId userID, String? email, String? displayName});
}

/// @nodoc
class __$$UserAuthEntityImplCopyWithImpl<$Res>
    extends _$UserAuthEntityCopyWithImpl<$Res, _$UserAuthEntityImpl>
    implements _$$UserAuthEntityImplCopyWith<$Res> {
  __$$UserAuthEntityImplCopyWithImpl(
      _$UserAuthEntityImpl _value, $Res Function(_$UserAuthEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? email = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$UserAuthEntityImpl(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserAuthEntityImpl extends _UserAuthEntity {
  const _$UserAuthEntityImpl(
      {required this.userID, required this.email, required this.displayName})
      : super._();

  @override
  final UniqueId userID;
  @override
  final String? email;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'UserAuthEntity(userID: $userID, email: $email, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAuthEntityImpl &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userID, email, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAuthEntityImplCopyWith<_$UserAuthEntityImpl> get copyWith =>
      __$$UserAuthEntityImplCopyWithImpl<_$UserAuthEntityImpl>(
          this, _$identity);
}

abstract class _UserAuthEntity extends UserAuthEntity {
  const factory _UserAuthEntity(
      {required final UniqueId userID,
      required final String? email,
      required final String? displayName}) = _$UserAuthEntityImpl;
  const _UserAuthEntity._() : super._();

  @override
  UniqueId get userID;
  @override
  String? get email;
  @override
  String? get displayName;
  @override
  @JsonKey(ignore: true)
  _$$UserAuthEntityImplCopyWith<_$UserAuthEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
