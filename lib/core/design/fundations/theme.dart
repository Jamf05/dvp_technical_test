part of './../design.dart';

class ThemeFoundation {
  ThemeFoundation._();

  static ValueNotifier<ThemeData> selected = ValueNotifier(blueLight);
  static get _isDark => selected.value.brightness == Brightness.dark;

  static ThemeData get reverseRedTheme {
    return _isDark ? ThemeFoundation.redLight : ThemeFoundation.redDark;
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
      _isDark ? ThemeFoundation.greenLight : ThemeFoundation.greenDark;

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
      _isDark ? ThemeFoundation.blueLight : ThemeFoundation.blueDark;

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
      _isDark ? ThemeFoundation.orangeLight : ThemeFoundation.orangeDark;

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
