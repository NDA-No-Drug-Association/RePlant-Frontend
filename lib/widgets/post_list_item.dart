import 'package:flutter/material.dart';
import 'package:replant_frontend/models/post_model.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const PostListItem({
    super.key,
    required this.post,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(
          '작성자: ${post.author} | ${post.createdAt.toLocal().toString().split(' ')[0]}',
        ),
        onTap: onTap,
      ),
    );
  }
}
