part of 'app_settings.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();
  AppTheme._internal();
  factory AppTheme._() => _instance;
  factory AppTheme._fromJson(Map<String, dynamic> json) => AppTheme._();

  static ValueNotifier<ThemeData> selected = ValueNotifier(blueLight);
  static get _isDark => selected.value.brightness == Brightness.dark;

  static ThemeData get reverseRedTheme {
    return _isDark ? AppTheme.redLight : AppTheme.redDark;
  }

  static final redLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.red.withOpacity(0.05)),
      ),
    ),
  );
  static final redDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red[700],
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.red.withOpacity(0.05)),
      ),
    ),
  );

  static ThemeData get reverseGreenTheme =>
      _isDark ? AppTheme.greenLight : AppTheme.greenDark;

  static final greenLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.green.withOpacity(0.05)),
      ),
    ),
  );
  static final greenDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green[700],
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.green.withOpacity(0.05)),
      ),
    ),
  );

  static ThemeData get reverseBlueTheme =>
      _isDark ? AppTheme.blueLight : AppTheme.blueDark;

  static final blueLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.blue.withOpacity(0.05)),
      ),
    ),
  );
  static final blueDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.blue.withOpacity(0.05)),
      ),
    ),
  );

  static ThemeData get reverseOrangeTheme =>
      _isDark ? AppTheme.orangeLight : AppTheme.orangeDark;

  static final orangeLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.orange.withOpacity(0.05)),
      ),
    ),
  );
  static final orangeDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.orange,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.orange.withOpacity(0.05)),
      ),
    ),
  );
}
