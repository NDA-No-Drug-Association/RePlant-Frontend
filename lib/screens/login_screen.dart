import 'package:flutter/material.dart';
import 'package:replant_frontend/utils/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Replant_logo.png', width: 300, height: 300),
              const SizedBox(height: 10),
              const Text(
                '다시 살아갈 당신에게 희망을 🍀',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 120),
              // 카카오 로그인 버튼
              SizedBox(
                width: 320,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // 로그인 성공 후 홈 화면으로 이동
                    // Pushing `AppRoutes.home` and removing all previous routes.
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.home,
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset(
                    'assets/kakao_login.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 네이버 로그인 버튼
              SizedBox(
                width: 320,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: 네이버 로그인 구현
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  child: Image.asset(
                    'assets/Naver_login.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
