import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/circular_progress_indicator_widget.dart';

/// - parameters :
///   - [`text`]: Texto que se va mostrar en el boton
///   - [`onPressed`]: Accion a realizar
///   - [`description`]: Crea un boton con estilo personalizado para reutilizarlo.
class ButtonWidget extends StatelessWidget {
  final String? text;
  final Widget? child;
  final double? width;
  final double? heigth;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final bool? disable;
  final bool? loading;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double sizeLoading;
  final double strokeWidthLoading;
  const ButtonWidget({
    Key? key,
    this.text,
    this.child,
    this.width,
    this.heigth = 44,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    required this.onPressed,
    this.disable = false,
    this.loading = false,
    this.sizeLoading = 30,
    this.strokeWidthLoading = 2.5,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disable == true || loading == true ? 0.5 : 1,
      child: TextButton(
        onPressed: disable == true || loading == true ? () {} : onPressed,
        style: TextButton.styleFrom(
            foregroundColor: AppTheme.isDark
                ? AppColors.whiteFirst
                : AppColors.blackFirst,
            padding: EdgeInsets.zero,
            backgroundColor: backgroundColor,
            textStyle: textStyle ?? AppFonts.promptR14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: AppColors.greySecond))),
        child: Container(
          width: width,
          height: heigth,
          alignment: Alignment.center,
          child: loading == true
              ? CircularProgressWidget(
                  color: AppColors.greySecond,
                  strokeWidth: strokeWidthLoading,
                  heightCPI: sizeLoading,
                  widthCPI: sizeLoading,
                  height: sizeLoading,
                  width: sizeLoading,
                )
              : child ??
                  Text(text ?? '', style: textStyle ?? AppFonts.promptR14),
        ),
      ),
    );
  }
}
