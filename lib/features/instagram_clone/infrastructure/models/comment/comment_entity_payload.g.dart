// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentEntityPayloadImpl _$$CommentEntityPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentEntityPayloadImpl(
      commentID: json['commentID'] as String?,
      comment: json['comment'] as String,
      createdAt: json['created_at'] as Object,
      userID: json['userID'] as String,
      postID: json['postID'] as String,
    );

Map<String, dynamic> _$$CommentEntityPayloadImplToJson(
        _$CommentEntityPayloadImpl instance) =>
    <String, dynamic>{
      'commentID': instance.commentID,
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'userID': instance.userID,
      'postID': instance.postID,
    };
