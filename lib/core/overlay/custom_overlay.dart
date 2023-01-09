import 'package:dvp_technical_test/core/design/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:simple_overlay/simple_overlay.dart';

class CustomOverlay {
  final BuildContext _context;
  CustomOverlay._(this._context);
  static CustomOverlay of(BuildContext context) => CustomOverlay._(context);
  Future<T?> dialog<T>(
      {Widget? child,
      Color borderColor = ColorsToken.white,
      Color? backgroundColor = Colors.transparent,
      bool barrierDismissible = true,
      void Function()? onClose}) async {
    Future<T?> future = showDialog<T>(
        context: _context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            padding: const EdgeInsets.fromLTRB(23, 23, 18, 39),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: child,
          ));
        });
    await future.then((void value) => onClose?.call());
    return future;
  }

  Future<T?> dialogSecondary<T>(
      {Widget? child,
      Color? borderColor = Colors.white,
      Color? backgroundColor = Colors.transparent,
      void Function()? onClose}) async {
    Future<T?> future = showDialog<T>(
        context: _context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(23, 23, 18, 39),
                  decoration: BoxDecoration(
                    border: borderColor != null
                        ? Border.all(color: borderColor)
                        : null,
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: child ?? const SizedBox()));
        });
    await future.then((void value) => onClose?.call());
    return future;
  }

  Future<T?> dialogDefault<T>({
    Widget? child,
    EdgeInsets? insetPadding =
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    bool? barrierDismissible = true,
  }) {
    return showDialog<T>(
      barrierDismissible: barrierDismissible == true,
      context: _context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: insetPadding,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: child,
        );
      },
    );
  }

  Future<T?> modal<T>({
    required Widget? child,
    bool? isScrollControlled = true,
    Future<T?>? Function(T?)? onCloseModal,
    bool? isDismissible = true,

    /// ignore the default SingleChildScrollView
    Widget? overrideChild,
  }) async {
    Future<T?> future = showModalBottomSheet<T>(
        isScrollControlled: isScrollControlled == true,
        isDismissible: isDismissible == true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        context: _context,
        builder: (BuildContext bc) {
          if (overrideChild != null) {
            return overrideChild;
          } else {
            return SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(_context).viewInsets.bottom),
                  child: child),
            );
          }
        });
    if (onCloseModal != null) {
      return await future.then<T?>((T? v) => onCloseModal.call(v));
    } else {
      return await future;
    }
  }

  void scaffoldSnackbar(
      {required String? message,
      String? labelAction = "",
      void Function()? onPressedAction,
      Color? backgroundColor = Colors.black,
      TextStyle? style}) {
    onPressedAction ??= () {};
    final snackBar = SnackBar(
      content: Text(message ?? '', style: style),
      backgroundColor: backgroundColor,
      action:
          SnackBarAction(label: labelAction ?? '', onPressed: onPressedAction),
    );
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  void eitherError(Failure l) {
    return NotificationOverlay.of(_context).notification("¡Ups, algo va mal!",
        subtitle: l.message,
        icon: const Icon(
          Icons.bug_report_outlined,
          color: ColorsToken.black,
        ));
  }

  void successNotification(String message, {String? subtitle}) {
    return NotificationOverlay.of(_context).notification(message,
        subtitle: subtitle,
        icon: SvgPicture.asset(
          AssetsToken.icons.loadedIcon,
          width: 25, height: 25,
        ));
  }

  Future<TimeOfDay?> timePicker() {
    Future<TimeOfDay?> selectedTime = showTimePicker(
      context: _context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        final Widget mediaQueryWrapper = MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
          child: child ?? const SizedBox(),
        );
        // A hack to use the es_US dateTimeFormat value.
        if (Localizations.localeOf(context).languageCode == 'es') {
          return Localizations.override(
            context: context,
            locale: const Locale('es', 'US'),
            child: mediaQueryWrapper,
          );
        }
        return mediaQueryWrapper;
      },
    );
    return selectedTime;
  }
}
