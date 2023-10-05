// requiest_post_and_comments
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/date_sorting.dart';
part 'post_details_entity.freezed.dart';

@freezed
abstract class PostDetailsEntity implements _$PostDetailsEntity {
  const PostDetailsEntity._();
  const factory PostDetailsEntity({
    required String postID,
    @Default(true) bool? sortByCreateAt,
    @Default(DateSorting.newestOnTop) DateSorting? dateSorting,
    @Default(null) int? limit,
  }) = _PostDetailsEntity;
}
