import 'package:dvp_technical_test/features/app/pages/address_list_page/address_list_page.dart';
import 'package:dvp_technical_test/features/app/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:dvp_technical_test/features/app/pages/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> of(BuildContext context) {
    return <String, Widget Function(BuildContext)>{
      SplashPage.route: (BuildContext context) => const SplashPage(),
      HomePage.route: (BuildContext context) => const HomePage(),
      AddressListPage.route: (BuildContext context) => const AddressListPage(),
    };
  }
}
