import 'package:flutter/material.dart';

class AppRouter {
  final BuildContext context;
  AppRouter._(this.context);

  static AppRouter of(context) {
    return AppRouter._(context);
  }

  /// **Navigator.push()** shortcut.
  Future<T?> to<T extends Object>(Widget route) {
    return Navigator.push<T>(
      context,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => route,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  /// **Navigator.pushNamed()** shortcut.
  Future<T?> toNamed<T extends Object>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(context, routeName, arguments: arguments);
  }

  /// **Navigator.pushReplacement()** shortcut.
  Future<T?> off<T extends Object?, TO extends Object?>(Widget newRoute,
      {TO? result}) {
    return Navigator.pushReplacement<T, TO>(
        context,
        PageRouteBuilder<T>(
          pageBuilder: (context, animation, secondaryAnimation) => newRoute,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
        result: result);
  }

  /// **Navigator.pushReplacementNamed()** shortcut.
  Future<T?> offNamed<T extends Object, TO extends Object>(String routeName,
      {TO? result, Object? arguments}) {
    return Navigator.pushReplacementNamed<T, TO>(context, routeName,
        result: result, arguments: arguments);
  }

  /// **Navigator.pushAndRemoveUntil()** shortcut.
  Future<T?> offAll<T extends Object>(Widget newRoute,
      {bool Function(Route<dynamic>)? predicate}) {
    return Navigator.of(context).pushAndRemoveUntil<T>(
        PageRouteBuilder<T>(
          pageBuilder: (context, animation, secondaryAnimation) => newRoute,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
        predicate ?? (Route<dynamic> route) => false);
  }

  /// **Navigator.pushNamedAndRemoveUntil()** shortcut.
  Future<T?> offAllNamed<T extends Object>(String newRouteName,
      {bool Function(Route<dynamic>)? predicate, Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil<T>(
        context, newRouteName, predicate ?? (Route<dynamic> route) => false,
        arguments: arguments);
  }

  /// **Navigation.popUntil()** shortcut.
  void until(RoutePredicate predicate) {
    return Navigator.popUntil(context, predicate);
  }

  /// **Navigator.pop()** shortcut.
  void back<T extends Object>({T? result}) {
    return Navigator.pop<T>(context, result);
  }

  /// **Navigation.popUntil()** (with predicate) shortcut .<br><br>
  void close(int times) {
    if (times < 1) times = 1;
    var count = 0;
    Navigator.of(context).popUntil((route) => count++ == times);
  }
}
