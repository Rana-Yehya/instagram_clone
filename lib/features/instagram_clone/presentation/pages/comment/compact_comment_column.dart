import 'package:flutter/material.dart';
import 'package:instagram_clone/features/instagram_clone/domain/entities/comment/comment_entity.dart';
import 'package:instagram_clone/features/instagram_clone/presentation/pages/comment/compact_comment_tile.dart';

class CompactCommentColumn extends StatelessWidget {
  final Iterable<CommentEntity> commentEntityList;
  const CompactCommentColumn({super.key, required this.commentEntityList});

  @override
  Widget build(BuildContext context) {
    if (commentEntityList.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: commentEntityList
            .map((comment) => CompactCommentTile(commentEntity: comment))
            .toList(),
      ),
    );
  }
}
