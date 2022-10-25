import 'package:flutter/material.dart';
import 'package:dvp_technical_test/features/app/pages/date_selection_page.dart';
import 'package:dvp_technical_test/features/app/pages/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> of(BuildContext context) {
    return <String, Widget Function(BuildContext)>{
      HomePage.route: (BuildContext context) => const HomePage(),
      DateSelectionPage.route: (BuildContext context) => const DateSelectionPage(),
    };
  }
}
