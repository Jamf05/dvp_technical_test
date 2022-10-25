part of 'app_settings.dart';
class AppFonts {

  static final AppFonts _instance = AppFonts._internal();
  AppFonts._internal();
  factory AppFonts._() => _instance;
  factory AppFonts._fromJson(Map<String, dynamic> json) => AppFonts._();

  // Prompt

  static final TextStyle promptB24 = GoogleFonts.prompt(fontSize: 24, fontWeight: FontWeight.w700);
  static final TextStyle promptB22 = GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.w700);
  static final TextStyle promptB20 = GoogleFonts.prompt(fontSize: 20, fontWeight: FontWeight.w700);
  static final TextStyle promptB19 = GoogleFonts.prompt(fontSize: 19, fontWeight: FontWeight.w700);
  static final TextStyle promptB18 = GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.w700);
  static final TextStyle promptB17 = GoogleFonts.prompt(fontSize: 17, fontWeight: FontWeight.w700);
  static final TextStyle promptB16 = GoogleFonts.prompt(fontSize: 16, fontWeight: FontWeight.w700);
  static final TextStyle promptB15 = GoogleFonts.prompt(fontSize: 15, fontWeight: FontWeight.w700);
  static final TextStyle promptB14 = GoogleFonts.prompt(fontSize: 14, fontWeight: FontWeight.w700);
  static final TextStyle promptB13 = GoogleFonts.prompt(fontSize: 13, fontWeight: FontWeight.w700);
  static final TextStyle promptB12 = GoogleFonts.prompt(fontSize: 12, fontWeight: FontWeight.w700);
  static final TextStyle promptB11 = GoogleFonts.prompt(fontSize: 11, fontWeight: FontWeight.w700);
  
  static final TextStyle promptM24 = GoogleFonts.prompt(fontSize: 24, fontWeight: FontWeight.w500);
  static final TextStyle promptM22 = GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.w500);
  static final TextStyle promptM20 = GoogleFonts.prompt(fontSize: 20, fontWeight: FontWeight.w500);
  static final TextStyle promptM19 = GoogleFonts.prompt(fontSize: 19, fontWeight: FontWeight.w500);
  static final TextStyle promptM18 = GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.w500);
  static final TextStyle promptM17 = GoogleFonts.prompt(fontSize: 17, fontWeight: FontWeight.w500);
  static final TextStyle promptM16 = GoogleFonts.prompt(fontSize: 16, fontWeight: FontWeight.w500);
  static final TextStyle promptM15 = GoogleFonts.prompt(fontSize: 15, fontWeight: FontWeight.w500);
  static final TextStyle promptM14 = GoogleFonts.prompt(fontSize: 14, fontWeight: FontWeight.w500);
  static final TextStyle promptM13 = GoogleFonts.prompt(fontSize: 13, fontWeight: FontWeight.w500);
  static final TextStyle promptM12 = GoogleFonts.prompt(fontSize: 12, fontWeight: FontWeight.w500);
  static final TextStyle promptM11 = GoogleFonts.prompt(fontSize: 11, fontWeight: FontWeight.w500);

  static final TextStyle promptR24 = GoogleFonts.prompt(fontSize: 24, fontWeight: FontWeight.w400);
  static final TextStyle promptR22 = GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.w400);
  static final TextStyle promptR20 = GoogleFonts.prompt(fontSize: 20, fontWeight: FontWeight.w400);
  static final TextStyle promptR19 = GoogleFonts.prompt(fontSize: 19, fontWeight: FontWeight.w400);
  static final TextStyle promptR18 = GoogleFonts.prompt(fontSize: 18, fontWeight: FontWeight.w400);
  static final TextStyle promptR17 = GoogleFonts.prompt(fontSize: 17, fontWeight: FontWeight.w400);
  static final TextStyle promptR16 = GoogleFonts.prompt(fontSize: 16, fontWeight: FontWeight.w400);
  static final TextStyle promptR15 = GoogleFonts.prompt(fontSize: 15, fontWeight: FontWeight.w400);
  static final TextStyle promptR14 = GoogleFonts.prompt(fontSize: 14, fontWeight: FontWeight.w400);
  static final TextStyle promptR13 = GoogleFonts.prompt(fontSize: 13, fontWeight: FontWeight.w400);
  static final TextStyle promptR12 = GoogleFonts.prompt(fontSize: 12, fontWeight: FontWeight.w400);
  static final TextStyle promptR11 = GoogleFonts.prompt(fontSize: 11, fontWeight: FontWeight.w400);

  static final TextStyle promptL24 = GoogleFonts.prompt(fontSize: 24, fontWeight: FontWeight.w300);
  static final TextStyle promptL22 = GoogleFonts.prompt(fontSize: 22, fontWeight: FontWeight.w300);
  static final TextStyle promptL20 = GoogleFonts.prompt(fontSize: 20, fontWeight: FontWeight.w300);
  static final TextStyle promptL19 = GoogleFonts.prompt(fontSize: 19, fontWeight: FontWeight.w300);
  static final TextStyle promptL18 = GoogleFonts.prompt(fontSize: 19, fontWeight: FontWeight.w300);
  static final TextStyle promptL17 = GoogleFonts.prompt(fontSize: 17, fontWeight: FontWeight.w300);
  static final TextStyle promptL16 = GoogleFonts.prompt(fontSize: 16, fontWeight: FontWeight.w300);
  static final TextStyle promptL15 = GoogleFonts.prompt(fontSize: 15, fontWeight: FontWeight.w300);
  static final TextStyle promptL14 = GoogleFonts.prompt(fontSize: 14, fontWeight: FontWeight.w300);
  static final TextStyle promptL13 = GoogleFonts.prompt(fontSize: 13, fontWeight: FontWeight.w300);
  static final TextStyle promptL12 = GoogleFonts.prompt(fontSize: 12, fontWeight: FontWeight.w300);
  static final TextStyle promptL11 = GoogleFonts.prompt(fontSize: 11, fontWeight: FontWeight.w300);

  static final TextStyle inputTextStyle = GoogleFonts.prompt(fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.blackFirst);
  static final TextStyle hintTextStyle = GoogleFonts.prompt(fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.greyThird);
}
