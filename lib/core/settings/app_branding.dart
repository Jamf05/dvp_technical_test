part of 'app_settings.dart';

class AppBranding {

  static final AppBranding _instance = AppBranding._internal();
  AppBranding._internal();
  factory AppBranding._() => _instance;
  factory AppBranding._fromJson(Map<String, dynamic> json) => AppBranding._();
}