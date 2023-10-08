import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/date_sorting.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/post_details/post_details_entity.dart';

extension Sorting on Iterable<CommentEntity> {
  Iterable<CommentEntity> applySorting(PostDetailsEntity request) {
    if (request.sortByCreateAt != null) {
      final sortedDocuments = toList()
        ..sort(
          (a, b) {
            switch (request.dateSorting) {
              case DateSorting.newestOnTop:
                return b.createdAt!.compareTo(a.createdAt!);
              case DateSorting.oldestOnTop:
                return a.createdAt!.compareTo(b.createdAt!);
              case null:
                return b.createdAt!.compareTo(a.createdAt!);
            }
          },
        );
      return sortedDocuments;
    } else {
      return this;
    }
  }
}
