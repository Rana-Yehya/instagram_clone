// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentEntityPayload _$$_CommentEntityPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_CommentEntityPayload(
      comment: json['comment'] as String,
      createdAt: json['created_at'] as Object,
      userID: json['userID'] as String,
      postID: json['postID'] as String,
    );

Map<String, dynamic> _$$_CommentEntityPayloadToJson(
        _$_CommentEntityPayload instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'userID': instance.userID,
      'postID': instance.postID,
    };
