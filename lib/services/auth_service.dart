import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 현재 사용자 가져오기
  User? get currentUser => _auth.currentUser;

  // 이메일 인증 상태 확인
  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  // 이메일 인증 메일 보내기
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw Exception('이메일 인증 메일 전송에 실패했습니다: $e');
    }
  }

  // 비밀번호 재설정 이메일 보내기
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('비밀번호 재설정 이메일 전송에 실패했습니다: $e');
    }
  }

  // 이메일로 로그인
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('로그인에 실패했습니다: $e');
    }
  }

  // 이메일로 회원가입
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('회원가입에 실패했습니다: $e');
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('로그아웃에 실패했습니다: $e');
    }
  }

  // 사용자 정보 Firestore에 저장
  Future<void> saveUserData(String uid, Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(uid).set(userData);
    } catch (e) {
      throw Exception('사용자 정보 저장에 실패했습니다: $e');
    }
  }

  // 인증 상태 변경 스트림
  Stream<User?> get authStateChanges => _auth.authStateChanges();
} 