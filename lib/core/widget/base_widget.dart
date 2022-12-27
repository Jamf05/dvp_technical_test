export 'package:dvp_technical_test/core/settings/app_settings.dart';
export 'package:dvp_technical_test/core/overlay/custom_overlay.dart';

import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';

class BaseWidget {
  static late AppLocalizations _l10n;
  static late Size _size;
  static late ThemeData _theme;
  static late bool _isDarkTheme;

  AppLocalizations get l10n => BaseWidget._l10n;
  Size get size => BaseWidget._size;
  ThemeData get theme => BaseWidget._theme;
  bool get isDarkTheme => BaseWidget._isDarkTheme;

  static void init(BuildContext context) {
    _l10n = AppLocalizations.of(context);
    _size = MediaQuery.of(context).size;
    _theme = Theme.of(context);
    _isDarkTheme = _theme.brightness == Brightness.dark;
  }
}