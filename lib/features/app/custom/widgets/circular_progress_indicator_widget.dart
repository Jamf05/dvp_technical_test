import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';

class CircularProgressWidget extends StatelessWidget {
  final Color? color;
  final double? widthCPI;
  final double? heightCPI;
  final double? width;
  final double? height;
  final bool? center;
  final double strokeWidth;
  const CircularProgressWidget({
    super.key,
    this.color,
    this.widthCPI = 40.0,
    this.heightCPI = 40.0,
    this.width = 40.0,
    this.height = 40.0,
    this.center = true,
    this.strokeWidth= 4.0,
  });
  @override
  Widget build(BuildContext context) {
    if (center == true) {
      return Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: SizedBox(
            width: widthCPI,
            height: heightCPI,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(color ?? AppSettings.colors.primaryColor),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: height,
        child: SizedBox(
          width: widthCPI,
          height: heightCPI,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color ?? AppSettings.colors.primaryColor),
          ),
        ),
      );
    }
  }
}