export 'package:dvp_technical_test/core/routing/app_router.dart';
export 'package:dvp_technical_test/core/settings/app_settings.dart';
export 'package:dvp_technical_test/core/overlay/custom_overlay.dart';

import 'package:dvp_technical_test/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlay.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late Size size;
  late AppRouter router;
  late CustomOverlay overlay; 
  late AppLocalizations l10n;
  late ThemeData theme;
  late bool isDarkTheme;
  
  @override
  void initState() {
    onInitState.call();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    router = AppRouter.of(context);
    size = MediaQuery.of(context).size;
    l10n = AppLocalizations.of(context);
    overlay = CustomOverlay.of(context);
    theme = Theme.of(context);
    isDarkTheme = theme.brightness == Brightness.dark;
    super.didChangeDependencies();
  }
  
  void onInitState() {}
}