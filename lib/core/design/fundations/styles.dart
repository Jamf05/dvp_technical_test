part of './../design.dart';

class StylesFoundation {
  StylesFoundation._internal();

  static const borderInputLight = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: ColorsToken.black,
        width: 1.0
  ));

  static const borderInputDark = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: ColorsToken.white,
        width: 1.0
  ));

  static const borderRadius = BorderRadius.all(Radius.circular(12));

  static const contentPaddingInput =
      EdgeInsets.symmetric(vertical: 14.0, horizontal: 13.0);

  static const boxShadow = [
    BoxShadow(
      blurRadius: 6.0,
      color: ColorsToken.gray900,
      offset: Offset(0, 3)
    ),
  ];
}
