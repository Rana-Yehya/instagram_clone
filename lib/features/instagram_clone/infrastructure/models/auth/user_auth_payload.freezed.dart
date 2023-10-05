// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAuthPayload _$UserAuthPayloadFromJson(Map<String, dynamic> json) {
  return _UserAuthPayload.fromJson(json);
}

/// @nodoc
mixin _$UserAuthPayload {
//@JsonKey(ignore: true, name: Constants.userID) required String userID,
//@JsonKey(name: Constants.displayName) required String? displayName,
// @JsonKey(name: Constants.email) required String? email,
  @JsonKey(name: Constants.userID)
  String get userID => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.displayName)
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: Constants.email)
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAuthPayloadCopyWith<UserAuthPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthPayloadCopyWith<$Res> {
  factory $UserAuthPayloadCopyWith(
          UserAuthPayload value, $Res Function(UserAuthPayload) then) =
      _$UserAuthPayloadCopyWithImpl<$Res, UserAuthPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.displayName) String? displayName,
      @JsonKey(name: Constants.email) String? email});
}

/// @nodoc
class _$UserAuthPayloadCopyWithImpl<$Res, $Val extends UserAuthPayload>
    implements $UserAuthPayloadCopyWith<$Res> {
  _$UserAuthPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? displayName = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAuthPayloadCopyWith<$Res>
    implements $UserAuthPayloadCopyWith<$Res> {
  factory _$$_UserAuthPayloadCopyWith(
          _$_UserAuthPayload value, $Res Function(_$_UserAuthPayload) then) =
      __$$_UserAuthPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: Constants.userID) String userID,
      @JsonKey(name: Constants.displayName) String? displayName,
      @JsonKey(name: Constants.email) String? email});
}

/// @nodoc
class __$$_UserAuthPayloadCopyWithImpl<$Res>
    extends _$UserAuthPayloadCopyWithImpl<$Res, _$_UserAuthPayload>
    implements _$$_UserAuthPayloadCopyWith<$Res> {
  __$$_UserAuthPayloadCopyWithImpl(
      _$_UserAuthPayload _value, $Res Function(_$_UserAuthPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? displayName = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_UserAuthPayload(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAuthPayload extends _UserAuthPayload {
  const _$_UserAuthPayload(
      {@JsonKey(name: Constants.userID) required this.userID,
      @JsonKey(name: Constants.displayName) required this.displayName,
      @JsonKey(name: Constants.email) required this.email})
      : super._();

  factory _$_UserAuthPayload.fromJson(Map<String, dynamic> json) =>
      _$$_UserAuthPayloadFromJson(json);

//@JsonKey(ignore: true, name: Constants.userID) required String userID,
//@JsonKey(name: Constants.displayName) required String? displayName,
// @JsonKey(name: Constants.email) required String? email,
  @override
  @JsonKey(name: Constants.userID)
  final String userID;
  @override
  @JsonKey(name: Constants.displayName)
  final String? displayName;
  @override
  @JsonKey(name: Constants.email)
  final String? email;

  @override
  String toString() {
    return 'UserAuthPayload(userID: $userID, displayName: $displayName, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAuthPayload &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userID, displayName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAuthPayloadCopyWith<_$_UserAuthPayload> get copyWith =>
      __$$_UserAuthPayloadCopyWithImpl<_$_UserAuthPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAuthPayloadToJson(
      this,
    );
  }
}

abstract class _UserAuthPayload extends UserAuthPayload {
  const factory _UserAuthPayload(
      {@JsonKey(name: Constants.userID) required final String userID,
      @JsonKey(name: Constants.displayName) required final String? displayName,
      @JsonKey(name: Constants.email)
      required final String? email}) = _$_UserAuthPayload;
  const _UserAuthPayload._() : super._();

  factory _UserAuthPayload.fromJson(Map<String, dynamic> json) =
      _$_UserAuthPayload.fromJson;

  @override //@JsonKey(ignore: true, name: Constants.userID) required String userID,
//@JsonKey(name: Constants.displayName) required String? displayName,
// @JsonKey(name: Constants.email) required String? email,
  @JsonKey(name: Constants.userID)
  String get userID;
  @override
  @JsonKey(name: Constants.displayName)
  String? get displayName;
  @override
  @JsonKey(name: Constants.email)
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserAuthPayloadCopyWith<_$_UserAuthPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
