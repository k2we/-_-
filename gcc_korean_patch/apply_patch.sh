#!/usr/bin/env bash
set -euo pipefail

PATCH_DIR="${1:-gcc_korean_patch}"
if [[ ! -f "$PATCH_DIR/lib/l10n/app_ko.arb" ]]; then
  echo "Patch folder not found: $PATCH_DIR" >&2
  echo "Extract the ZIP in the repository root, then run: bash gcc_korean_patch/apply_patch.sh" >&2
  exit 1
fi
if [[ ! -f lib/l10n/app_en.arb || ! -f lib/pages/settings_page.dart || ! -f lib/enums/locale_option.dart ]]; then
  echo "Run this script from the root of the GrowCastleCalculator repository." >&2
  exit 1
fi

cp "$PATCH_DIR/lib/l10n/app_ko.arb" lib/l10n/app_ko.arb
cp "$PATCH_DIR/lib/enums/locale_option.dart" lib/enums/locale_option.dart
mkdir -p .github/workflows
cp "$PATCH_DIR/.github/workflows/build-android-apk.yml" .github/workflows/build-android-apk.yml

python3 - <<'PY'
from pathlib import Path
p = Path('lib/l10n/app_en.arb')
s = p.read_text(encoding='utf-8')
if '"ko_withCode"' not in s:
    old = '    "en_withCode": "en\\tEnglish",'
    new = old + '\n    "ko_withCode": "ko\\t한국어",'
    if old not in s:
        raise SystemExit('Could not find en_withCode in app_en.arb; no changes to that file were made.')
    p.write_text(s.replace(old, new, 1), encoding='utf-8')

p = Path('lib/pages/settings_page.dart')
s = p.read_text(encoding='utf-8')
if 'label: loc.ko_withCode' not in s:
    old = '''          _buildDialogOption(
            label: loc.en_withCode,
            isSelected: currentLocaleChoice == 2,
            onTap: () => Navigator.of(ctx).pop(2),
          ),'''
    new = old + '''
          _buildDialogOption(
            label: loc.ko_withCode,
            isSelected: currentLocaleChoice == 3,
            onTap: () => Navigator.of(ctx).pop(3),
          ),'''
    if old not in s:
        raise SystemExit('Could not find English language option in settings_page.dart; add the snippet from patches/settings_page_addition.txt manually.')
    p.write_text(s.replace(old, new, 1), encoding='utf-8')
print('Korean localization patch applied.')
print('Next: review git diff, commit changes, then run Actions → Build Android APK.')
PY
