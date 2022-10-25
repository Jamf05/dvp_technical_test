import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/overlay/custom_overlays.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:dvp_technical_test/core/utils/navigation.dart';

abstract class BaseBlocState<T extends StatefulWidget,K extends Bloc> extends State<T>{
  late K bloc;
  late Size size;
  late Nav nav;
  late Show show; 
  late AppLocalizations l10n;

  AppFonts get fonts => AppSettings.fonts;
  AppColors get colors => AppSettings.colors;
  AppIcons get icons => AppSettings.icons;
  AppStyles get styles => AppSettings.styles;
  AppAssets get assets => AppSettings.assets;
  AppBranding get identity => AppSettings.identity;
  AppTheme get theme => AppSettings.theme;
  
  @override
  void initState() {
    bloc = sl<K>();
    onInitState.call();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    nav = Nav.of(context);
    size = MediaQuery.of(context).size;
    l10n = AppLocalizations.of(context);
    show = Show.of(context);
    super.didChangeDependencies();
  }
  
  void onInitState() {}
}