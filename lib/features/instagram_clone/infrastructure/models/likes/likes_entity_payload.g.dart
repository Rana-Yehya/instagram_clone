// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_entity_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikestEntityPayload _$$_LikestEntityPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_LikestEntityPayload(
      postID: json['postID'] as String,
      userID: json['userID'] as String,
      createdAt: ServerTimestampConverter.fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_LikestEntityPayloadToJson(
        _$_LikestEntityPayload instance) =>
    <String, dynamic>{
      'postID': instance.postID,
      'userID': instance.userID,
      'createdAt': ServerTimestampConverter.toJson(instance.createdAt),
    };
