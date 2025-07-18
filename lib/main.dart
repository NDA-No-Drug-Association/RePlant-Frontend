import 'package:flutter/material.dart';
import 'package:replant_frontend/screens/login_screen.dart';
import 'package:replant_frontend/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 앱의 첫 화면은 LoginScreen으로 유지합니다.
      home: const LoginScreen(),
      // 생성한 AppRoutes를 사용하여 네비게이션을 관리합니다.
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
