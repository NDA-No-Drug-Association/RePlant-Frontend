class EmailValidator {
  // 이메일 형식 검증
  static bool isValidEmail(String email) {
    if (email.isEmpty) return false;
    
    // 기본적인 이메일 형식 검증
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // 이메일 도메인 검증 (선택사항)
  static bool isValidDomain(String email) {
    if (!isValidEmail(email)) return false;
    
    final domain = email.split('@')[1];
    final validDomains = [
      'gmail.com',
      'naver.com',
      'daum.net',
      'kakao.com',
      'outlook.com',
      'yahoo.com',
      'icloud.com',
    ];
    
    return validDomains.contains(domain.toLowerCase());
  }

  // 이메일 에러 메시지 반환
  static String? getEmailErrorMessage(String email) {
    if (email.isEmpty) {
      return '이메일을 입력해주세요';
    }
    
    if (!isValidEmail(email)) {
      return '올바른 이메일 형식이 아닙니다';
    }
    
    return null;
  }

  // 이메일 마스킹 처리 (개인정보 보호)
  static String maskEmail(String email) {
    if (!isValidEmail(email)) return email;
    
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 2) {
      return '***@$domain';
    }
    
    final maskedUsername = username[0] + '*' * (username.length - 2) + username[username.length - 1];
    return '$maskedUsername@$domain';
  }
} 