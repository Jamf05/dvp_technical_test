part of 'app_settings.dart';

class AppColors {

  Color _primaryColor = AppTheme.selected.value.primaryColor;
  Color get primaryColor => _instance._primaryColor;

  // Color _secondaryColor = const Color(0xffE5D095);
  // Color get secondaryColor => _instance._secondaryColor;

  // Color _tertiaryColor = const Color(0xffE5D095);
  // Color get tertiaryColor => _instance._tertiaryColor;

  static final AppColors _instance = AppColors._internal();
  AppColors._internal();
  factory AppColors._({
    @required Color? primaryColor,
    // @required Color? secondaryColor,
    // @required Color? tertiaryColor,
  }) {
    _instance._primaryColor = primaryColor ?? _instance._primaryColor;
    // _instance._secondaryColor = secondaryColor ?? _instance._secondaryColor;
    // _instance._tertiaryColor = tertiaryColor ?? _instance._tertiaryColor;
    return _instance;
  }

  factory AppColors._fromJson(Map<String, dynamic> json) => AppColors._(
    primaryColor: json["color"] != null ? HexadecimalColor.from(json["color"]) : _instance._primaryColor,
    // secondaryColor: json["color"] != null ? HexadecimalColor.fromHexadecimal(json["color"]) : _instance._secondaryColor,
    // secondaryColor: _instance._secondaryColor,
    // tertiaryColor: json["color"] != null ? HexadecimalColor.fromHexadecimal(json["color"]) : _instance._tertiaryColor,
    // tertiaryColor: _instance._tertiaryColor,
  );

  /// Color(0xffFF1720)
  static const Color redFirst = Color(0xffFF1720);

  /// Color(0xffFF6066)
  static const Color redSecond = Color(0xffFF6066);

  /// Color(0xffFF5158)
  static const Color redThird = Color(0xffFF5158);

  /// Color(0xffFF3B63)
  static const Color redFourth = Color(0xffFF3B63);

  /// Color(0xffFF3B63)
  static const Color redFifth = Color(0xffFF3B63);

  /// Colors.black
  static const Color blackFirst = Colors.black;

  /// Color(0xff191919)
  static const Color blackSecond = Color(0xff191919);
  
  /// Color(0xFF0D4DFF)
  static const Color blueFirst = Color(0xFF0D4DFF);

  /// Color(0xFF0892DD)
  static const Color blueSecond = Color(0xFF0892DD);

  /// Color(0xff2196F3)
  static const Color blueThird = Color(0xff2196F3);

  /// Color(0xFF5D5D5D)
  static const Color greyFirst = Color(0xFF5D5D5D);

  /// Color(0xFFDBDBDB)
  static const Color greySecond = Color(0xFFDBDBDB);

  /// Color(0xff666666)
  static const Color greyThird = Color(0xff666666);

  /// Color(0xFFF6F9FB)
  static const Color greyFourth = Color(0xFFF6F9FB);

  /// Color(0xffffffff)
  static const Color whiteFirst = Colors.white;

  /// Color(0xFFFF612B)
  static const Color orangeFirst = Color(0xFFFF612B);

  /// Color(0xFFFF792E)
  static const Color orangeSecond = Color(0xFFFF792E);

  /// Color(0xFFFF5806)
  static const Color orangeThird = Color(0xFFFF5806);

  /// Color(0xFFFF5806)
  static const Color orangeFourth = Color(0xFFFF5806);

  /// Color(0xFFFFF3EA)
  static const Color orangeFifth = Color(0xFFFFF3EA);

  /// Color(0xFF32FFAD)
  static const Color greenFirst = Color(0xFF32FFAD);

  /// Color(0xFF03D6BC)
  static const Color greenSecond = Color(0xFF03D6BC);

  /// Color(0xff32cf80)
  static const Color greenThird = Color(0xff32cf80);

  /// Color(0xff29D884)
  static const Color greenFourth = Color(0xff29D884);

  /// Color(0xFF9508EB)
  static const Color purpleFirst = Color(0xFF9508EB);

  /// Color(0xFFD9D7E9)
  static const Color purpleSecond = Color(0xFFD9D7E9);

  /// Color(0xFFD6017B)
  static const Color fuchsiaFirst = Color(0xFFD6017B);

  /// Color(0xFF03D6BC)
  static const Color degradeFirst = Color(0xFF03D6BC);

  /// Color(0xFF0D4DFF)
  static const Color degradeSecond = Color(0xFF0D4DFF);

  /// Color(0xFFFF9D32)
  static const Color degradeThird = Color(0xFFFF9D32);

  /// Color(0xFFFF2525)
  static const Color degradeFourth = Color(0xFFFF2525);

  /// Color(0xFFFC006D)
  static const Color degradeFifth = Color(0xFFFC006D);

  /// Color(0xFFB20289)
  static const Color degradeSixth = Color(0xFFB20289);

  /// Color(0xFFD603D6)
  static const Color degradeSeventh = Color(0xFFD603D6);

  /// Color(0xFF550DFF)
  static const Color degradeEighth = Color(0xFF550DFF);

  /// Color(0xFFFF327F)
  static const Color degradeNinth = Color(0xFFFF327F);

  /// Color(0xFFFF2534)
  static const Color degradeTenth = Color(0xFFFF2534);

  /// Color(0xffFAFAFA)
  static const Color yellowFirst = Color(0xffFF8B32);

  /// Color(0xffFFE3C5)
  static const Color yellowSecond = Color(0xffFFE3C5);

  /// Color(0xffFFDF00)
  static const Color yellowThird = Color(0xffFFDF00);

  /// Color(0xFFFF9D32)
  static const Color goldFirst = Color(0xffE5D095);

  /// Color(0xFF28D07B)
  static const Color greenAccentFirst = Color(0xFF28D07B);

  /// Color(0xff78C3FF)
  static const Color lightGreenFirst = Color(0xff28D07B);

  /// Color(0xff78C3FF)
  static const Color lightGreenSecond = Color(0xffe9faf2);

  /// Color(0xffc8eecc)
  static const Color lightGreenThird = Color(0xffc8eecc);

  /// Color(0xff#f4fdf9)
  static const Color lightGreenFourth = Color(0xfff4fdf9);

  /// Color(0xffEEFCF5)
  static const Color lightGreenFifth = Color(0xffEEFCF5);

  /// Color(0xffFFF1F2)
  static const Color lightRedFirst = Color(0xffFFF1F2);
}
