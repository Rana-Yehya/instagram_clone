import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/core/entity/unique_id.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/image_or_video.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_settings.dart';
part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity implements _$PostEntity {
  const PostEntity._();
  const factory PostEntity({
    required String postID,
    required UniqueId userID,
    required String message,
    required DateTime? createdAt,
    required String thumbnailURL,
    required String fileURL,
    required ImageOrVideo imageOrVideo,
    required String fileName,
    required double aspectRatio,
    required String thumbnailStorageID,
    required String originalFileStorageID,
    required Map<PostSetting, bool> postSettings,
  }) = _PostEntity;

  factory PostEntity.empty() => PostEntity(
        postID: '',
        userID: UniqueId.fromUnique(''),
        message: '',
        createdAt: null,
        thumbnailURL: '',
        fileURL: '',
        imageOrVideo: ImageOrVideo.image,
        fileName: '',
        aspectRatio: 0.0,
        thumbnailStorageID: '',
        originalFileStorageID: '',
        postSettings: <PostSetting, bool>{},
      );
      
  bool get allowsLikes => postSettings[PostSetting.allowLikes] ?? false;
  bool get allowsComments => postSettings[PostSetting.allowComments] ?? false;
}
