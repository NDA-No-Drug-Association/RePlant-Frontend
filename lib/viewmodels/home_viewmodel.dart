import 'package:flutter/material.dart';
import 'package:replant_frontend/models/post_model.dart';
import 'package:replant_frontend/service/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  HomeViewModel() {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _posts = await _apiService.fetchPosts();
    } catch (e) {
      // 에러 처리, 예: print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
