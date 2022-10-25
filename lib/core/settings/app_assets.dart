part of "app_settings.dart";
class AppAssets {

  static final AppAssets _instance = AppAssets._internal();
  AppAssets._internal();
  factory AppAssets._() => _instance;
  factory AppAssets._fromJson(Map<String, dynamic> json) => AppAssets._();
}