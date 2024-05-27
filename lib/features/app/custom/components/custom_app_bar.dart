import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? overrideTitle;
  final String? titleText;
  final TextStyle? titleTextStyle;
  final double? elevation;
  final Widget? leading;
  final Color? leadingIconColor;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Color? actionsColor;
  final Color? backgroundColor;
  final bool? centerTitle;
  final Color? shadowColor;
  @override
  final Size preferredSize;
  final double? toolbarHeight;
  final double? titleSpacing;
  CustomAppBar(
      {super.key,
      this.overrideTitle,
      this.elevation = 1,
      this.titleText,
      this.titleTextStyle,
      this.leading = const BackButton(
        color: AppColors.blackFirst,
      ),
      this.actions = const [],
      this.bottom,
      this.backgroundColor = AppColors.whiteFirst,
      this.leadingIconColor,
      this.actionsColor,
      this.centerTitle,
      this.toolbarHeight,
      this.titleSpacing,
      this.shadowColor = AppColors.whiteFirst})
      : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: leadingIconColor ?? AppColors.blackFirst),
      titleSpacing: titleSpacing,
      actionsIconTheme:
          IconThemeData(color: actionsColor ?? AppColors.blackFirst),
      title: overrideTitle ?? Text(
        titleText ?? '',
        style: AppFonts.promptM15,
      ),
      elevation: elevation,
      backgroundColor: backgroundColor ?? AppColors.whiteFirst,
      leading: leading,
      centerTitle: centerTitle,
      bottom: bottom,
      actions: actions,
      shadowColor: shadowColor,
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
