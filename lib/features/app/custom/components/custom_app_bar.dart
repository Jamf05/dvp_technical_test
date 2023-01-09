import 'package:dvp_technical_test/core/design/design.dart';
import 'package:flutter/material.dart';

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
      {Key? key,
      this.overrideTitle,
      this.elevation = 1,
      this.titleText,
      this.titleTextStyle,
      this.leading = const BackButton(
        color: ColorsToken.black,
      ),
      this.actions = const [],
      this.bottom,
      this.backgroundColor = ColorsToken.white,
      this.leadingIconColor,
      this.actionsColor,
      this.centerTitle,
      this.toolbarHeight,
      this.titleSpacing,
      this.shadowColor = ColorsToken.white})
      : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: leadingIconColor ?? ColorsToken.black),
      titleSpacing: titleSpacing,
      actionsIconTheme:
          IconThemeData(color: actionsColor ?? ColorsToken.black),
      title: overrideTitle ?? Text(
        titleText ?? '',
        style: FontsFoundation.primaryM15,
      ),
      elevation: elevation,
      backgroundColor: backgroundColor ?? ColorsToken.white,
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
