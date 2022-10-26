import 'package:dvp_technical_test/core/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';

abstract class BaseStateless extends StatelessWidget {
  static late AppLocalizations _l10n;
  static late Size _size;
  static late Show _show;
  static late Nav _nav;

  AppFonts get fonts => AppSettings.fonts;
  AppColors get colors => AppSettings.colors;
  AppIcons get icons => AppSettings.icons;
  AppStyles get styles => AppSettings.styles;
  AppAssets get assets => AppSettings.assets;
  AppBranding get identity => AppSettings.identity;
  AppTheme get theme => AppSettings.theme;

  const BaseStateless({Key? key}) : super(key: key); 
  AppLocalizations get l10n => BaseStateless._l10n;
  Size get size => BaseStateless._size;
  Show get show => BaseStateless._show;
  Nav get nav => BaseStateless._nav;
  static void init(BuildContext context) {
    _l10n = AppLocalizations.of(context);
    _size = MediaQuery.of(context).size;
    _show = Show.of(context);
    _nav = Nav.of(context);
  }
}