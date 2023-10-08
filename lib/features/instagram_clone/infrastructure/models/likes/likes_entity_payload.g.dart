// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_entity_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikesEntityPayload _$$_LikesEntityPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_LikesEntityPayload(
      postID: json['postID'] as String,
      userID: json['userID'] as String,
      createdAt: json['created_at'] as Object,
    );

Map<String, dynamic> _$$_LikesEntityPayloadToJson(
        _$_LikesEntityPayload instance) =>
    <String, dynamic>{
      'postID': instance.postID,
      'userID': instance.userID,
      'created_at': instance.createdAt,
    };
