import 'package:flutter/material.dart';
import 'package:replant_frontend/screens/home/home_screen.dart';
import 'package:replant_frontend/screens/post/post_detail_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String postDetail = '/post-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case postDetail:
        final postId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => PostDetailScreen(postId: postId));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${settings.name} 경로를 찾을 수 없습니다.'),
            ),
          ),
        );
    }
  }
}
