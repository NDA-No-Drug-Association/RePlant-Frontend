import 'package:replant_frontend/models/post_model.dart';

class ApiService {
  // 가짜 데이터로 채워진 게시물 목록을 가져오는 비동기 함수
  Future<List<Post>> fetchPosts() async {
    // 실제 앱에서는 여기서 http 요청을 보냅니다.
    await Future.delayed(const Duration(seconds: 1)); // 네트워크 지연 흉내

    return List.generate(10, (index) {
      return Post(
        id: index + 1,
        title: '게시물 제목 ${index + 1}',
        content: '이것은 게시물 내용입니다. Flutter는 정말 멋져요! ${index + 1}',
        author: '작성자 ${index + 1}',
        createdAt: DateTime.now().subtract(Duration(days: index)),
      );
    });
  }

  // ID로 특정 게시물을 가져오는 함수 (예시)
  Future<Post> fetchPost(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return Post(
      id: id,
      title: '게시물 제목 $id',
      content: '상세 내용입니다.',
      author: '작성자 $id',
      createdAt: DateTime.now(),
    );
  }
}
