import 'package:dvp_technical_test/core/design/design.dart';
import 'package:flutter/material.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/circular_progress_indicator_widget.dart';
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
  final bool visible;
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
    this.visible = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Opacity(
        opacity: disable == true || loading == true ? 0.5 : 1,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0.0),
          child: TextButton(
            onPressed: disable == true || loading == true ? () {} : onPressed,
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).brightness == Brightness.dark
                    ? ColorsToken.white
                    : ColorsToken.black,
                padding: EdgeInsets.zero,
                backgroundColor: backgroundColor,
                textStyle: textStyle ?? FontsFoundation.primaryR14,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: ColorsToken.gray900))),
            child: Container(
              margin: margin,
              width: width,
              height: heigth,
              alignment: Alignment.center,
              child: loading == true
                  ? CircularProgressWidget(
                      color: ColorsToken.gray900,
                      strokeWidth: strokeWidthLoading,
                      heightCPI: sizeLoading,
                      widthCPI: sizeLoading,
                      height: sizeLoading,
                      width: sizeLoading,
                    )
                  : child ??
                      Text(text ?? '', style: textStyle ?? FontsFoundation.primaryR14),
            ),
          ),
        ),
      ),
    );
  }
}
