import 'dart:ui';

extension BrightnessExtensions on Brightness {
  Brightness get inverted {
    if(this == Brightness.dark) {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }
}