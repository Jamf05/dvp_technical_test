export 'package:dvp_technical_test/core/utils/navigation.dart';
export 'package:dvp_technical_test/core/settings/app_settings.dart';

import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';

class BaseWidget {
  static late AppLocalizations _l10n;
  static late Size _size;
  static late Show _show; 

  AppFonts get fonts => AppSettings.fonts;
  AppColors get colors => AppSettings.colors;
  AppIcons get icons => AppSettings.icons;
  AppStyles get styles => AppSettings.styles;
  AppAssets get assets => AppSettings.assets;
  AppBranding get identity => AppSettings.identity;
  AppTheme get theme => AppSettings.theme;

  AppLocalizations get l10n => BaseWidget._l10n;
  Size get size => BaseWidget._size;
  Show get show => BaseWidget._show;
  static void init(BuildContext context) {
    _l10n = AppLocalizations.of(context);
    _size = MediaQuery.of(context).size;
    _show = Show.of(context);
  }
}