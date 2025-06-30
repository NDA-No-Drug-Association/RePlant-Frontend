import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _isSending = false;
  bool _isChecking = false;
  String? _message;

  final AuthService _authService = AuthService();

  Future<void> _checkVerification() async {
    setState(() {
      _isChecking = true;
      _message = null;
    });
    await _authService.currentUser?.reload();
    if (_authService.isEmailVerified) {
      if (mounted) {
        Navigator.of(context).pop(true); // 인증 완료 시 이전 화면으로 true 반환
      }
    } else {
      setState(() {
        _message = '아직 이메일 인증이 완료되지 않았습니다.';
      });
    }
    setState(() {
      _isChecking = false;
    });
  }

  Future<void> _resendEmail() async {
    setState(() {
      _isSending = true;
      _message = null;
    });
    try {
      await _authService.sendEmailVerification();
      setState(() {
        _message = '인증 메일을 다시 보냈습니다.';
      });
    } catch (e) {
      setState(() {
        _message = '메일 전송에 실패했습니다. 다시 시도해주세요.';
      });
    }
    setState(() {
      _isSending = false;
    });
  }

  Future<void> _logout() async {
    await _authService.signOut();
    if (mounted) {
      Navigator.of(context).pop(false); // 로그아웃 시 이전 화면으로 false 반환
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이메일 인증'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.email_outlined, size: 80, color: Color(0xFF7CB342)),
            const SizedBox(height: 24),
            const Text(
              '이메일 인증이 필요합니다',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              '가입하신 이메일로 인증 메일을 보냈습니다.\n이메일을 확인하고 인증을 완료해주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            if (_message != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  _message!,
                  style: const TextStyle(color: Colors.red, fontSize: 15),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isChecking ? null : _checkVerification,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7CB342),
                    foregroundColor: Colors.white,
                  ),
                  child: _isChecking
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('인증 완료 확인'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: _isSending ? null : _resendEmail,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF7CB342),
                    side: const BorderSide(color: Color(0xFF7CB342)),
                  ),
                  child: _isSending
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF7CB342)),
                        )
                      : const Text('이메일 재전송'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            TextButton(
              onPressed: _logout,
              child: const Text('로그아웃', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
} 