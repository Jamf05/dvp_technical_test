part of 'app_settings.dart';

class AppStyles {

  static final AppStyles _instance = AppStyles._internal();
  AppStyles._internal();
  factory AppStyles._() => _instance;
  factory AppStyles._fromJson(Map<String, dynamic> json) => AppStyles._();

  static const borderInput = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: AppColors.blackSecond, width: 1.0));

  static const borderRadius = BorderRadius.all(Radius.circular(12));

  static const contentPaddingInput =
      EdgeInsets.symmetric(vertical: 14.0, horizontal: 13.0);

  static const boxShadow = [
    BoxShadow(
      blurRadius: 6.0,
      color: AppColors.greySecond,
      offset: Offset(0, 3)
    ),
  ];
}
