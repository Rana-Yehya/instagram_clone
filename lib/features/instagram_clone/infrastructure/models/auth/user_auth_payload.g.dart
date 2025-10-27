// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAuthPayloadImpl _$$UserAuthPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAuthPayloadImpl(
      userID: json['userID'] as String,
      displayName: json['display_name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$UserAuthPayloadImplToJson(
        _$UserAuthPayloadImpl instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'display_name': instance.displayName,
      'email': instance.email,
    };
