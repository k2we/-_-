# Grow Castle Calculator 한국어 번역 패치

이 패치는 공개 GrowCastleCalculator Flutter 소스에 한국어 번역 파일과 언어 선택 코드를 추가하기 위한 자료입니다. **완성된 APK가 아닙니다.** 원본 소스 저장소에 적용하고 클라우드 빌드를 실행해야 합니다.

## 들어 있는 파일
- `lib/l10n/app_ko.arb`: 앱 UI 번역 문자열
- `lib/enums/locale_option.dart`: 한국어 로케일 선택을 포함한 교체 파일
- `patches/app_en_addition.txt`: 영어 번역 파일에 추가할 한국어 언어명 키
- `patches/settings_page_addition.txt`: 설정의 언어 선택 창에 추가할 항목
- `.github/workflows/build-android-apk.yml`: GitHub Actions 클라우드 APK 빌드 워크플로

## 휴대폰만으로 적용하기

### 가능한 경우: Codespaces 사용
1. GitHub에서 `https://github.com/FnxAg/GrowCastleCalculator`를 열고 계정으로 로그인한 뒤 **Fork**를 눌러 본인 저장소를 만듭니다.
2. 이 ZIP을 내려받아 Codespaces 파일 탐색기에서 저장소 루트로 업로드한 뒤 압축을 풉니다.
3. 터미널에서 `bash gcc_korean_patch/apply_patch.sh`를 실행합니다. 스크립트가 번역 파일, 언어 선택 코드, 빌드 워크플로를 추가하고 기존 두 파일을 수정합니다.
4. `git diff --check`로 변경 사항을 확인한 뒤 변경 사항을 커밋합니다.
5. 저장소의 **Actions → Build Android APK → Run workflow**를 누릅니다. 첫 실행 때 Actions 사용을 허용해야 할 수 있습니다.
8. 빌드가 성공하면 실행 결과의 **Artifacts**에서 `grow-castle-calculator-apks`를 눌러 APK 묶음을 내려받습니다. 휴대폰의 CPU에 맞는 `app-arm64-v8a-release.apk`가 보통 최신 안드로이드 폰에 맞지만, 기기에 따라 다를 수 있습니다.

### Codespaces를 사용할 수 없다면
GitHub 웹 편집기에서 각 파일을 직접 추가/수정해야 합니다. 이 경우 위의 `patches/app_en_addition.txt`와 `patches/settings_page_addition.txt` 안내를 따르세요. 모바일 화면에서 여러 파일을 편집하는 작업은 다소 번거로울 수 있습니다.

## 주의 사항
- 이 작업 환경에는 Flutter SDK가 설치되어 있지 않고 GitHub에 직접 커밋할 권한도 없어서, 여기서 APK를 빌드하거나 테스트했다고 말할 수는 없습니다.
- 소스 저장소의 라이선스와 원작자 표시를 유지하세요. 이 패치는 원본 앱 개발자의 공식 번역 릴리스가 아닙니다.
- 원래 설치한 APK와 서명 키가 다르므로 업데이트로 덮어쓰지 못할 수 있습니다. 설치 시 서명 충돌이 나면 기존 앱의 데이터를 백업한 뒤 기존 앱을 제거하고 새 APK를 설치해야 할 수 있습니다. 데이터 손실을 피하려면 먼저 앱의 데이터 내보내기 기능을 사용하세요.
- `app_ko.arb`는 번역된 UI 문자열을 포함하지만, 앱 코드에서 직접 작성한 영어 문구나 서버가 보내는 문구까지 모두 자동 번역되는 것은 아닙니다. 빌드 후 화면을 확인해 남은 문구를 추가로 번역해야 할 수 있습니다.
