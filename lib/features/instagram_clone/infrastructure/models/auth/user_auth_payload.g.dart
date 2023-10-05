// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAuthPayload _$$_UserAuthPayloadFromJson(Map<String, dynamic> json) =>
    _$_UserAuthPayload(
      userID: json['userID'] as String,
      displayName: json['display_name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserAuthPayloadToJson(_$_UserAuthPayload instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'display_name': instance.displayName,
      'email': instance.email,
    };
