

home.dart
54줄

dart


login.dart
228줄

dart


main.dart
27줄

dart


signup.dart
475줄

dart

현재 내 파일들이야

보여주신 Flutter 앱의 코드를 분석해보니, Firebase Authentication과 Firestore를 사용한 "Replant"라는 앱이네요. 전체적으로 잘 구성되어 있습니다.

현재 앱 구조:

main.dart: 앱 진입점, Firebase 초기화
login.dart: 로그인 화면 (이메일/비밀번호 인증)
signup.dart: 5단계 회원가입 프로세스 (이메일, 아이디, 비밀번호, 생년월일, 성별)
home.dart: 로그인 후 홈 화면
코드의 장점:

Firebase Auth와 Firestore 통합이 잘 되어 있음
에러 처리가 적절히 구현됨
한국어 UI로 사용자 친화적
단계별 회원가입 UX가 좋음
로딩 상태 관리가 잘 되어 있음
개선 제안사항:

홈 화면 기능 확장: 현재 홈 화면이 너무 단순함
입력 검증 강화: 아이디 중복 체크, 더 강한 비밀번호 정책
사용자 프로필 관리: 정보 수정 기능
비밀번호 재설정: 이메일로 비밀번호 찾기
앱의 핵심 기능: "Replant"라는 이름에 맞는 메인 기능들
어떤 부분을 개선하거나 추가하고 싶으신지 알려주시면 도움을 드릴 수 있습니다!




스크린샷 20250630 오후 12.33.37.png
처음화면은 이 이미지(assets/Replant_logo.png)를 활용하고 그 밑에 텍스트 그 밑에 버튼 RePlant 시작하기이 있으면 좋겠어 그리고 넘어갔을때 로그인 화면도 저 로고가 있으면 좋겠고

스플래시 화면을 추가하고 로그인 화면도 개선해드릴게요!


splash.dart - 스플래시 화면
코드 

login.dart - 로고가 포함된 로그인 화면
코드 

main.dart - 스플래시 화면으로 시작
코드 
완성했습니다! 🌱

새로 추가/수정된 내용:





import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),

                // 로고 이미지
                Image.asset(
                  'assets/Replant_logo.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 16),
                
                // 앱 슬로건
                const Text(
                  '다시 살아갈 당신에게 희망을 🍀',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 60),

                // 로그인 폼
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '로그인',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 이메일 입력
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: '이메일',
                          hintText: 'example@email.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFF7CB342), width: 2),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF7CB342)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '이메일을 입력해주세요';
                          }
                          if (!value.contains('@')) {
                            return '올바른 이메일 형식이 아닙니다';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // 비밀번호 입력
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: '비밀번호',
                          hintText: '비밀번호를 입력하세요',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFF7CB342), width: 2),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF7CB342)),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '비밀번호를 입력해주세요';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 24),

                      // 로그인 버튼
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7CB342),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  '로그인',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 회원가입 링크
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '계정이 없으신가요? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        '회원가입',
                        style: TextStyle(
                          color: Color(0xFF7CB342),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = '로그인에 실패했습니다.';

      switch (e.code) {
        case 'user-not-found':
          message = '등록되지 않은 이메일입니다.';
          break;
        case 'wrong-password':
          message = '비밀번호가 올바르지 않습니다.';
          break;
        case 'invalid-email':
          message = '올바르지 않은 이메일 형식입니다.';
          break;
        case 'too-many-requests':
          message = '너무 많은 시도가 있었습니다. 잠시 후 다시 시도해주세요.';
          break;
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red[400],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}