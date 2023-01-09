export 'package:dvp_technical_test/core/design/design.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlay.dart';
import 'package:simple_router/simple_router.dart';

abstract class BaseBlocState<T extends StatefulWidget,K extends Bloc> extends State<T>{
  late K bloc;
  late Size size;
  late SimpleRouter router;
  late CustomOverlay overlay; 
  late AppLocalizations l10n;
  late ThemeData theme;
  late bool isDarkTheme;
  
  @override
  void initState() {
    bloc = sl<K>();
    onInitState.call();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    router = SimpleRouter.of(context);
    size = MediaQuery.of(context).size;
    l10n = AppLocalizations.of(context);
    overlay = CustomOverlay.of(context);
    theme = Theme.of(context);
    isDarkTheme = theme.brightness == Brightness.dark;
    super.didChangeDependencies();
  }
  
  void onInitState() {}
}