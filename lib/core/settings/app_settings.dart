library app_settings;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dvp_technical_test/core/extensions/color.dart';

export '../extensions/color.dart';
export '../extensions/date_time.dart';
export '../extensions/list.dart';
export '../extensions/string.dart';
export '../extensions/time_of_day.dart';
export 'package:dvp_technical_test/gen/assets.gen.dart';

part 'app_assets.dart';
part 'app_colors.dart';
part 'app_fonts.dart';
part 'app_icons.dart';
part 'app_styles.dart';
part 'app_branding.dart';
part 'app_theme.dart';


class AppSettings {

  late AppFonts _fonts;
  late AppColors _colors;
  late AppIcons _icons;
  late AppStyles _styles;
  late AppAssets _assets;
  late AppBranding _identity;
  late AppTheme _theme;

  bool _initialized = false;

  static final AppSettings _instance = AppSettings._internal();
  AppSettings._internal();

  factory AppSettings() {
    _instance._colors = AppColors._internal();
    _instance._fonts = AppFonts._internal();
    _instance._styles = AppStyles._internal();
    _instance._identity = AppBranding._internal();
    _instance._assets = AppAssets._internal();
    _instance._icons = AppIcons._internal();
    _instance._theme = AppTheme._internal();
    return _instance;
  }

  factory AppSettings._({
    bool? initialized,
    required AppFonts fonts,
    required AppColors colors,
    required AppIcons icons,
    required AppStyles styles,
    required AppAssets assets,
    required AppBranding identity,
    required AppTheme theme,
  }) {
    _instance._initialized = initialized ?? _instance._initialized;
    _instance._fonts = fonts;
    _instance._colors = colors;
    _instance._icons = icons;
    _instance._styles = styles;
    _instance._assets = assets;
    _instance._identity = identity;
    _instance._theme = theme;
    return _instance;
  }
  
  static AppFonts get fonts => _instance._fonts;
  static AppColors get colors => _instance._colors;
  static AppIcons get icons => _instance._icons;
  static AppStyles get styles => _instance._styles;
  static AppAssets get assets => _instance._assets;
  static AppBranding get identity => _instance._identity;
  static AppTheme get theme => _instance._theme;

  static bool get initialized => _instance._initialized;

  factory AppSettings.init(Map<String, dynamic> json) => AppSettings._(
    fonts: AppFonts._fromJson(Map<String, dynamic>.from(json)),
    colors: AppColors._fromJson(Map<String, dynamic>.from(json)),
    icons: AppIcons._fromJson(Map<String, dynamic>.from(json)),
    styles: AppStyles._fromJson(Map<String, dynamic>.from(json)),
    assets: AppAssets._fromJson(Map<String, dynamic>.from(json)),
    identity: AppBranding._fromJson(Map<String, dynamic>.from(json)),
    theme: AppTheme._fromJson(Map<String, dynamic>.from(json)),
    initialized: true,
  );
}

