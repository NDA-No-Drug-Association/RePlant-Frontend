import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:replant_frontend/viewmodels/home_viewmodel.dart';
import 'package:replant_frontend/widgets/post_list_item.dart';
import 'package:replant_frontend/utils/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('피드'),
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.posts.isEmpty) {
              return const Center(child: Text('게시물이 없습니다.'));
            }

            return ListView.builder(
              itemCount: viewModel.posts.length,
              itemBuilder: (context, index) {
                final post = viewModel.posts[index];
                return PostListItem(
                  post: post,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.postDetail,
                      arguments: post.id,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
