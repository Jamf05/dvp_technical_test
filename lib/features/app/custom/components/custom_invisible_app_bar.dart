import 'package:dvp_technical_test/core/design/design.dart';
import 'package:dvp_technical_test/core/extensions/drightness.dart';
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
    Key? key,
    this.bottom,
    this.toolbarHeight,
    this.leading,
    this.actions,
  })  : preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      bottom: bottom,
      actions: actions,
      leading: ValueListenableBuilder<ThemeData>(
        valueListenable: ThemeFoundation.selected,
        builder: (context, value, child) {
          return leading ??
              BackButton(
                  color: value.brightness == Brightness.dark
                      ? ColorsToken.white
                      : ColorsToken.black);
        }
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // Status bar brightness (optional)
        statusBarIconBrightness:
            ThemeFoundation.selected.value.brightness.inverted, // For Android (dark icons)
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
