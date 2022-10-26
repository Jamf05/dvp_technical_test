import 'package:dvp_technical_test/features/app/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dvp_technical_test/core/env.dart';
import 'package:dvp_technical_test/core/localization/app_localizations.dart';
import 'package:dvp_technical_test/core/settings/app_routes.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/wrap_banner_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    AppSettings();
    AppTheme.selected = AppTheme.blueDark;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      builder: (_, __) {
        return WrapBanner(
          label: Env.environment,
          visible: Env.bannerEnvironment,
          child: MaterialApp(
              builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                  child: child!),
              navigatorObservers: [NavigationHistoryObserver()],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('es', 'US'),
                Locale("en"),
              ],
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
              routes: AppRoutes.of(context),
              theme: AppTheme.selected),
        );
      }
    );
  }
}
