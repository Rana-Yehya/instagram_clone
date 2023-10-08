import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post/data/post_entity.dart';

class PostCommentsEntity {
  final PostEntity postEntity;
  final Iterable<CommentEntity> commentEntityList;

  PostCommentsEntity({
    required this.postEntity,
    required this.commentEntityList,
  });
}
