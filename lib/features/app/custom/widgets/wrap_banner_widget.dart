import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class WrapBanner extends StatelessWidget {
  final Widget? child;
  final String? label;
  final Color? color ;
  final BannerLocation? location;
  final bool? visible;
  const WrapBanner({
    Key? key,
    required this.child,
    this.label = '',
    this.color = Colors.green,
    this.location = BannerLocation.topStart,
    this.visible = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (visible == true) {
      return Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Banner(
          location: location ?? BannerLocation.topStart,
          message: label ?? '',
          color: color ?? Colors.green,
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
          child: child,
        ),
      );
    } else {
      return child ?? const SizedBox();
    }
  }
}