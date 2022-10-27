export 'package:dvp_technical_test/core/settings/app_settings.dart';

import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/core/utils/navigation.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  late Size size;
  late Nav nav;
  late Show show; 
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
    nav = Nav.of(context);
    size = MediaQuery.of(context).size;
    l10n = AppLocalizations.of(context);
    show = Show.of(context);
    theme = Theme.of(context);
    isDarkTheme = theme.brightness == Brightness.dark;
    super.didChangeDependencies();
  }
  
  void onInitState() {}
}