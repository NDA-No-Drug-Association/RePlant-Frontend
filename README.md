# SDA (Soul Damage Area) - RePlant

> **사회적 고립, 은둔형 외톨이 등 사회취약계층의 심리적 회복과 행동 활성화를 돕는 앱**

---

## 목차
1. [프로젝트 개요](#프로젝트-개요)
2. [주요 기능](#주요-기능)
3. [기술 스택](#기술-스택)
4. [폴더 구조](#폴더-구조)
5. [설치 및 실행 방법](#설치-및-실행-방법)
6. [커밋 컨벤션](#커밋-컨벤션)
7. [라이선스/문의](#라이선스문의)
8. [향후 계획/로드맵](#향후-계획로드맵)

---

## 프로젝트 개요

SDA - RePlant 앱은 사회적 고립, 은둔형 외톨이 등 사회취약계층이 다시 사회로 나아갈 수 있도록 돕는 심리 지원 및 행동 활성화 모바일 애플리케이션입니다. 사용자가 일상 속 작은 행동부터 시작해 점진적으로 사회 복귀에 대한 자신감을 키울 수 있도록 지원합니다.

> **"오늘의 한걸음, 내일의 변화를 만든다"**

---

## 주요 기능

- **회원가입 및 로그인**: 이메일, 구글, 애플 계정으로 간편 가입/로그인 (Firebase Auth)
- **유저 캐릭터 시스템**: 성장형 캐릭터 및 레벨업, 활동 동기 부여
- **일일 미션 시스템**: 매일 소소한 사회적 활동 과제 제공
- **감정 입력 및 감정일기**: 매일 감정 선택 및 기록, 정서 추적
- **상담 채널/메시징**: 1:1 비대면 상담(향후 Spring Boot 전환)
- **알림 시스템**: 미션, 감정 입력 리마인더 등 푸시 알림
- **레벨업 및 보상**: 미션/활동 수행 시 경험치, 레벨업, 보상
- **관리자 기능**: 관리자 대시보드, 유저 데이터/상담 이력 관리(향후)
- **커뮤니티/리워드/익명 피드**: 향후 추가 예정

---

## 기술 스택

| 영역 | 사용 기술 |
|---|---|
| 프론트엔드 | Flutter |
| 백엔드 | Firebase (초기) → Spring Boot + MySQL/PostgreSQL/MongoDB (향후) |
| 인증 | Firebase Auth |
| 데이터베이스 | Firebase Firestore / Realtime DB → RDBMS 전환 가능 |
| 배포 | Google Play, App Store |

---

## 폴더 구조

```
RePlant-Frontend/
├── android/                # Android 네이티브 프로젝트 및 빌드 설정
│   ├── app/                # Android 앱 소스 및 리소스
│   ├── build.gradle.kts    # Android 빌드 설정
│   └── ...                 # 기타 Android 관련 파일/폴더
├── assets/                 # 앱에서 사용하는 이미지 등 정적 리소스
│   ├── character01.png
│   ├── kakao_login.png
│   ├── Naver_login.png
│   └── Replant_logo.png
├── build/                  # 빌드 산출물(자동 생성, gitignore)
├── ios/                    # iOS 네이티브 프로젝트 및 빌드 설정
│   ├── Runner/             # iOS 앱 소스 및 리소스
│   ├── Podfile             # CocoaPods 의존성 관리
│   └── ...                 # 기타 iOS 관련 파일/폴더
├── lib/                    # Flutter 앱의 핵심 소스 코드
│   ├── main.dart           # 앱 진입점
│   ├── login.dart          # (별도 로그인 관련 코드)
│   ├── signup.dart         # (별도 회원가입 관련 코드)
│   ├── screens/            # 주요 화면(페이지) 코드
│   │   ├── auth/           # 인증 관련 화면
│   │   │   ├── login.dart
│   │   │   ├── signup.dart
│   │   │   ├── email_verification.dart
│   │   │   └── signup_success.dart
│   │   ├── home.dart       # 홈 화면
│   │   └── splash.dart     # 스플래시 화면
│   ├── services/           # 서비스(비즈니스 로직, API 등)
│   │   └── auth_service.dart
│   ├── utils/              # 유틸리티 함수/클래스
│   │   └── email_validator.dart
│   └── widgets/            # 재사용 위젯
│       └── auth_widgets.dart
├── linux/                  # Linux 데스크탑 빌드 관련 파일
├── macos/                  # macOS 데스크탑 빌드 관련 파일
├── test/                   # 테스트 코드(주로 위젯 테스트)
│   └── widget_test.dart
├── web/                    # 웹 빌드 및 리소스
│   ├── index.html
│   ├── manifest.json
│   ├── favicon.png
│   ├── icons/
│   └── splash/
├── windows/                # Windows 데스크탑 빌드 관련 파일
├── .dart_tool/             # Dart/Flutter 툴 관련(자동 생성, gitignore)
├── .idea/                  # IDE 설정(자동 생성, gitignore)
├── .gitignore              # Git 무시 파일 목록
├── analysis_options.yaml   # Dart 분석기 옵션
├── pubspec.yaml            # Flutter/Dart 패키지 의존성 및 설정
├── pubspec.lock            # 실제 설치된 패키지 버전(자동 생성)
├── README.md               # 프로젝트 설명 문서
└── 기타 설정/메타 파일들
```

---

## 설치 및 실행 방법

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
   - `google-services.json`(Android), `GoogleService-Info.plist`(iOS) 추가
   - Firebase Authentication, Firestore, Realtime Database 활성화
4. **앱 실행**
   ```bash
   flutter run
   ```

## 커밋 컨벤션

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

---

## 라이선스/문의

- 라이선스: [MIT](LICENSE)
- 문의: [teamsda01@gmail.com]

---

## 향후 계획/로드맵

### 1. 회원가입 및 로그인
- [x] 이메일/비밀번호 회원가입 및 로그인
- [ ] 비밀번호 재설정
- [ ] 구글 로그인
- [ ] 애플 로그인
- [ ] 소셜 로그인 UI 개선

### 2. 유저 캐릭터 시스템
- [ ] 성장형 캐릭터 구현
- [ ] 캐릭터 레벨업 시스템
- [ ] 캐릭터 커스터마이징

### 3. 일일 미션 시스템
- [ ] 미션 생성/관리
- [ ] 미션 완료 체크 및 경험치 지급
- [ ] 미션 리마인더 알림

### 4. 감정 입력 및 감정일기
- [ ] 감정 선택 UI
- [ ] 감정일기 작성/저장
- [ ] 감정 통계/그래프

### 5. 상담 채널/메시징
- [ ] 1:1 비대면 상담 채팅
- [ ] 상담 이력 관리
- [ ] 위기 알림/신고 기능

### 6. 알림 시스템
- [ ] 푸시 알림 연동
- [ ] 미션/감정 입력 리마인더

### 7. 레벨업 및 보상 시스템
- [ ] 경험치/레벨 시스템
- [ ] 보상(아이템, 뱃지 등) 지급

### 8. 관리자 기능
- [ ] 관리자 대시보드
- [ ] 유저 데이터/상담 이력 관리
- [ ] 위기 사용자 모니터링

### 9. 커뮤니티/리워드/익명 피드
- [ ] 친구/커뮤니티 기능
- [ ] 리워드 시스템
- [ ] 익명 피드

### 10. 기타
- [x] 이메일 인증 시스템
- [ ] 사용자 프로필 관리
- [ ] 오프라인 모드 지원
- [ ] 다국어 지원
