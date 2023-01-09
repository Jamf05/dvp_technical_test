import 'package:flutter/material.dart';
import 'package:simple_router/simple_router.dart';

import '../overlay/custom_overlay.dart';

extension MediaQueryExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
}

extension OverlayExtension on BuildContext {
  CustomOverlay get overlay => CustomOverlay.of(this);
}

extension RouterExtension on BuildContext {
  SimpleRouter get router => SimpleRouter.of(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}