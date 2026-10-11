import 'dart:ui';
import 'package:grow_castle_calculator/app.dart';
import '../l10n/app_localizations.dart';

enum LocaleOption {
  sys,
  zh,
  en,
  ko;

  int get localeCode {
    switch (this) {
      case LocaleOption.sys:
        return 0;
      case LocaleOption.zh:
        return 1;
      case LocaleOption.en:
        return 2;
      case LocaleOption.ko:
        return 3;
    }
  }

  String get localeString {
    switch (this) {
      case LocaleOption.sys:
        return AppLocalizations.of(globalNavigatorKey.currentContext!)!.systemDefault;
      case LocaleOption.zh:
        return AppLocalizations.of(globalNavigatorKey.currentContext!)!.zh_CN_withCode;
      case LocaleOption.en:
        return AppLocalizations.of(globalNavigatorKey.currentContext!)!.en_withCode;
      case LocaleOption.ko:
        return AppLocalizations.of(globalNavigatorKey.currentContext!)!.ko_withCode;
    }
  }

  Locale get localeType {
    switch (this) {
      case LocaleOption.sys:
        return PlatformDispatcher.instance.locale;
      case LocaleOption.zh:
        return const Locale('zh');
      case LocaleOption.en:
        return const Locale('en');
      case LocaleOption.ko:
        return const Locale('ko');
    }
  }

  static LocaleOption fromLocaleCode2LocaleOption(int code) {
    for (var option in LocaleOption.values) {
      if (option.localeCode == code) {
        return option;
      }
    }
    return LocaleOption.values[0];
  }
}
