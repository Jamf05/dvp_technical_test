import 'package:dvp_technical_test/core/extensions/drightness.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInvisibleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final List<Widget>? actions;
  CustomInvisibleAppBar({
    super.key,
    this.bottom,
    this.toolbarHeight,
    this.leading,
    this.actions,
  })  : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      bottom: bottom,
      actions: actions,
      leading: ValueListenableBuilder<ThemeData>(
        valueListenable: AppTheme.selected,
        builder: (context, value, child) {
          return leading ??
              BackButton(
                  color: value.brightness == Brightness.dark
                      ? AppColors.whiteFirst
                      : AppColors.blackFirst);
        }
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // Status bar brightness (optional)
        statusBarIconBrightness:
            AppTheme.selected.value.brightness.inverted, // For Android (dark icons)
      ),
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
