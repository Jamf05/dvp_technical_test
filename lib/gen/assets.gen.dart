/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $EnvGen {
  const $EnvGen();

  /// File path: .env/.env
  String get env => '.env/.env';

  /// File path: .env/.env.development
  String get envDevelopment => '.env/.env.development';

  /// File path: .env/.env.production
  String get envProduction => '.env/.env.production';

  /// List of all assets
  List<String> get values => [env, envDevelopment, envProduction];
}

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/cute-dog.json
  String get cuteDog => 'assets/animations/cute-dog.json';

  /// File path: assets/animations/pet-hug.json
  String get petHug => 'assets/animations/pet-hug.json';

  /// File path: assets/animations/pet-lovers.json
  String get petLovers => 'assets/animations/pet-lovers.json';

  /// File path: assets/animations/pomeranian-dog.json
  String get pomeranianDog => 'assets/animations/pomeranian-dog.json';

  /// List of all assets
  List<String> get values => [cuteDog, petHug, petLovers, pomeranianDog];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/checkoutIcon.svg
  String get checkoutIcon => 'assets/icons/checkoutIcon.svg';

  /// File path: assets/icons/delete_icon.svg
  String get deleteIcon => 'assets/icons/delete_icon.svg';

  /// File path: assets/icons/dislike_icon.svg
  String get dislikeIcon => 'assets/icons/dislike_icon.svg';

  /// File path: assets/icons/dots_vertical_icon.svg
  String get dotsVerticalIcon => 'assets/icons/dots_vertical_icon.svg';

  /// File path: assets/icons/edit_icon.svg
  String get editIcon => 'assets/icons/edit_icon.svg';

  /// File path: assets/icons/favoriteblack.svg
  String get favoriteblack => 'assets/icons/favoriteblack.svg';

  /// File path: assets/icons/favoritered.svg
  String get favoritered => 'assets/icons/favoritered.svg';

  /// File path: assets/icons/fb_icon.svg
  String get fbIcon => 'assets/icons/fb_icon.svg';

  /// File path: assets/icons/google_icon.svg
  String get googleIcon => 'assets/icons/google_icon.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/instagram_icon.svg
  String get instagramIcon => 'assets/icons/instagram_icon.svg';

  /// File path: assets/icons/loaded_icon.svg
  String get loadedIcon => 'assets/icons/loaded_icon.svg';

  /// File path: assets/icons/map_pin.svg
  String get mapPin => 'assets/icons/map_pin.svg';

  /// File path: assets/icons/payment_icon.svg
  String get paymentIcon => 'assets/icons/payment_icon.svg';

  /// File path: assets/icons/question.svg
  String get question => 'assets/icons/question.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/star.svg
  String get star => 'assets/icons/star.svg';

  /// File path: assets/icons/twoDiners.svg
  String get twoDiners => 'assets/icons/twoDiners.svg';

  /// File path: assets/icons/user_icon.svg
  String get userIcon => 'assets/icons/user_icon.svg';

  /// List of all assets
  List<String> get values => [
        checkoutIcon,
        deleteIcon,
        dislikeIcon,
        dotsVerticalIcon,
        editIcon,
        favoriteblack,
        favoritered,
        fbIcon,
        googleIcon,
        heart,
        home,
        instagramIcon,
        loadedIcon,
        mapPin,
        paymentIcon,
        question,
        search,
        star,
        twoDiners,
        userIcon
      ];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/loading_screen.svg
  String get loadingScreen => 'assets/logos/loading_screen.svg';

  /// File path: assets/logos/logo.svg
  String get logo => 'assets/logos/logo.svg';

  /// List of all assets
  List<String> get values => [loadingScreen, logo];
}

class $AssetsSplashGen {
  const $AssetsSplashGen();

  /// File path: assets/splash/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/splash/splash.png');

  /// File path: assets/splash/splash_icon.png
  AssetGenImage get splashIconPng =>
      const AssetGenImage('assets/splash/splash_icon.png');

  /// File path: assets/splash/splash_icon.svg
  String get splashIconSvg => 'assets/splash/splash_icon.svg';

  /// List of all assets
  List<dynamic> get values => [splash, splashIconPng, splashIconSvg];
}

class Assets {
  Assets._();

  static const $EnvGen env = $EnvGen();
  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const AssetGenImage background =
      AssetGenImage('assets/background.png');
  static const AssetGenImage foreground =
      AssetGenImage('assets/foreground.png');
  static const AssetGenImage icon = AssetGenImage('assets/icon.png');
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const $AssetsSplashGen splash = $AssetsSplashGen();

  /// List of all assets
  List<AssetGenImage> get values => [background, foreground, icon];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
