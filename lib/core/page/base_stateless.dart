export 'package:dvp_technical_test/core/utils/navigation.dart';
export 'package:dvp_technical_test/core/settings/app_settings.dart';
export 'package:dvp_technical_test/core/overlay/custom_overlays.dart';

import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';

abstract class BaseStateless extends StatelessWidget {
  static late AppLocalizations _l10n;
  static late Size _size;
  static late ThemeData _theme;
  static late bool _isDarkTheme;

  const BaseStateless({super.key}); 
  AppLocalizations get l10n => BaseStateless._l10n;
  Size get size => BaseStateless._size;
  ThemeData get theme => BaseStateless._theme;
  bool get isDarkTheme => BaseStateless._isDarkTheme;

  static void init(BuildContext context) {
    _l10n = AppLocalizations.of(context);
    _size = MediaQuery.of(context).size;
    _theme = Theme.of(context);
    _isDarkTheme = _theme.brightness == Brightness.dark;
  }
}