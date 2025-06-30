# RePlant Frontend

RePlant은 "다시 살아갈 당신에게 희망을" 주는 식물 관련 모바일 애플리케이션입니다.

## 🌱 프로젝트 개요

- **프로젝트명**: RePlant
- **슬로건**: 다시 살아갈 당신에게 희망을 🍀
- **플랫폼**: Flutter (iOS, Android, Web, Desktop 지원)
- **상태**: 개발 중 (인증 시스템 완료)

## 🚀 주요 기능

### ✅ 구현 완료
- **사용자 인증 시스템**
  - 이메일/비밀번호 로그인
  - 회원가입 (5단계 프로세스)
  - 이메일 인증 시스템
    - 회원가입 시 인증 메일 발송
    - 이메일 인증 안내 화면
    - 인증 상태 확인 및 분기 처리
    - 인증 미완료 시 홈 화면 접근 제한
  - 로그아웃
- **Firebase 연동**
  - Firebase Authentication
  - Cloud Firestore (사용자 데이터 저장)
  - Firebase Realtime Database
- **UI/UX**
  - 모던하고 깔끔한 Material Design
  - 반응형 디자인
  - 한글 폰트 지원

### 🔄 개발 예정
- **비밀번호 찾기** (나중에 구현 예정)
- **소셜 로그인** (카카오, 네이버) - UI만 존재

## 📁 프로젝트 구조

```
lib/
├── main.dart                                    # 앱 진입점
├── screens/                                     # 화면들
│   ├── auth/                                    # 인증 관련 화면들
│   │   ├── login.dart                           # 로그인 화면
│   │   ├── signup.dart                          # 회원가입 화면
│   │   ├── email_verification.dart              # 이메일 인증 안내 화면
│   │   └── signup_success.dart                  # 회원가입 완료 화면
│   ├── home.dart                                # 메인 홈 화면
│   └── splash.dart                              # 스플래시 화면
├── services/                                    # 서비스 로직
│   └── auth_service.dart                        # 인증 관련 서비스
├── utils/                                       # 유틸리티
│   └── email_validator.dart                     # 이메일 유효성 검사
└── widgets/                                     # 재사용 가능한 위젯들
    └── auth_widgets.dart                        # 인증 관련 위젯들
```

## 🛠 기술 스택

### Frontend
- **Flutter**: 3.18.0+
- **Dart**: 3.8.0+
- **Material Design**: UI 프레임워크

### Backend & Database
- **Firebase Authentication**: 사용자 인증
- **Cloud Firestore**: 사용자 데이터 저장
- **Firebase Realtime Database**: 실시간 데이터

### Development Tools
- **Flutter Lints**: 코드 품질 관리
- **Flutter Native Splash**: 스플래시 화면

## 🎨 디자인 시스템

### 색상 테마
- **Primary**: `#7CB342` (초록색)
- **Secondary**: `#2E7D32` (진한 초록색)
- **Background**: `#FFFFFF` (흰색)
- **Text**: `#000000` (검은색), `#666666` (회색)

### 폰트
- **한글**: NotoSans
- **영문**: 시스템 기본 폰트

## 📱 화면 구성

### 1. 스플래시 화면
- RePlant 로고 표시
- 앱 소개 텍스트
- "시작하기" 버튼

### 2. 로그인 화면
- 이메일/비밀번호 입력
- 로그인 버튼
- 회원가입 링크
- 소셜 로그인 버튼 (UI만 존재)

### 3. 회원가입 화면
- 5단계 회원가입 프로세스:
  1. 이메일 입력
  2. 아이디 입력
  3. 비밀번호 입력
  4. 생년월일 입력
  5. 성별 선택
- 회원가입 완료 시 이메일 인증 메일 발송

### 4. 이메일 인증 화면
- 이메일 인증 안내 메시지
- 인증 메일 재전송 기능
- 인증 완료 확인 버튼
- 로그아웃 옵션

### 5. 홈 화면
- 사용자 환영 메시지
- 로그인된 이메일 표시
- 로그아웃 버튼
- **인증 완료된 사용자만 접근 가능**

## 🔧 개발 환경 설정

### 필수 요구사항
- Flutter SDK 3.18.0+
- Dart SDK 3.8.0+
- Android Studio / VS Code
- Firebase 프로젝트 설정

### 설치 및 실행

1. **저장소 클론**
```bash
git clone [repository-url]
cd RePlant-Frontend
```

2. **의존성 설치**
```bash
flutter pub get
```

3. **Firebase 설정**
   - Firebase 프로젝트 생성
   - `google-services.json` (Android) 및 `GoogleService-Info.plist` (iOS) 파일 추가
   - Firebase Authentication, Firestore, Realtime Database 활성화

4. **앱 실행**
```bash
flutter run
```

## 📋 커밋 컨벤션

| 타입         | 의미                                                    |
| ------------ | ------------------------------------------------------- |
| **feat**     | 새로운 기능 추가                                        |
| **fix**      | 버그 수정                                               |
| **docs**     | 문서 관련 작업 (README, Wiki 등)                        |
| **style**    | 코드 포맷팅, 들여쓰기, 공백 수정 (논리 변화 없음)       |
| **refactor** | 리팩토링 (기능 변화 없이 구조만 개선)                   |
| **test**     | 테스트 코드 추가 또는 수정                              |
| **chore**    | 기타 작업 (빌드 설정, 패키지 관리, CI 설정 등)          |
| **perf**     | 성능 향상                                               |
| **build**    | 빌드 시스템 수정 (webpack, gradle 등)                   |
| **ci**       | CI/CD 설정 관련 작업                                    |
| **assets**   | 이미지, 폰트, 비디오 등 정적 리소스 파일 추가/수정/삭제 |

## 🔮 향후 계획

### 단기 계획
- [x] 이메일 인증 시스템 구현 ✅
- [ ] 사용자 프로필 관리
- [ ] 식물 관련 기능 추가

### 장기 계획
- [ ] 소셜 로그인 (카카오, 네이버) 구현
- [ ] 푸시 알림 시스템
- [ ] 오프라인 모드 지원
- [ ] 다국어 지원

**RePlant** - 다시 살아갈 당신에게 희망을 🍀
