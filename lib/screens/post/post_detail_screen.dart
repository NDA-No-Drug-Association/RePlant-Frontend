import 'package:flutter/material.dart';
import 'package:replant_frontend/models/post_model.dart';
import 'package:replant_frontend/service/api_service.dart';

class PostDetailScreen extends StatefulWidget {
  final int postId;

  const PostDetailScreen({super.key, required this.postId});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final ApiService _apiService = ApiService();
  Future<Post>? _postFuture;

  @override
  void initState() {
    super.initState();
    _postFuture = _apiService.fetchPost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시물 상세'),
      ),
      body: FutureBuilder<Post>(
        future: _postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('에러: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('게시물을 찾을 수 없습니다.'));
          }

          final post = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  '작성자: ${post.author} | ${post.createdAt.toLocal().toString().split(' ')[0]}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Divider(height: 32),
                Text(post.content),
              ],
            ),
          );
        },
      ),
    );
  }
}
