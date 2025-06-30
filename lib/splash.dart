import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // 로고 이미지
              Image.asset(
                'assets/Replant_logo.png',
                width: 300, // 300에서 200으로 조정 (더 균형잡힌 크기)
                height: 300,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 1),

              // 체크 아이콘과 설명 텍스트들
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check, color: Color(0xFF7CB342), size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '회복 습관부터 따뜻한 소통까지, 지금 내 주변을',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4), // 줄 간격 조정

              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 26), // 체크 아이콘 공간만큼 들여쓰기
                  Expanded(
                    child: Text(
                      '설정하고 시작해보세요! 🌱',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 4),

              // 시작하기 버튼
              Container(
                width: double.infinity,
                height: 52, // 버튼 높이 약간 증가
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7CB342),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    '시작 하기',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600, // 폰트 weight 약간 증가
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
