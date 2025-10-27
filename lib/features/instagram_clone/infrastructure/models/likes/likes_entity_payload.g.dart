// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_entity_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikesEntityPayloadImpl _$$LikesEntityPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$LikesEntityPayloadImpl(
      postID: json['postID'] as String,
      userID: json['userID'] as String,
      createdAt: json['created_at'] as Object,
    );

Map<String, dynamic> _$$LikesEntityPayloadImplToJson(
        _$LikesEntityPayloadImpl instance) =>
    <String, dynamic>{
      'postID': instance.postID,
      'userID': instance.userID,
      'created_at': instance.createdAt,
    };
