import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:dvp_technical_test/core/failures/failure.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/modal_decoration_widget.dart';

class Show {
  final BuildContext _context;
  final Size _size;
  Show._(this._context, this._size);

  static Show of(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Show._(context, size);
  }

  Future<T?> dialog<T>(
      {Widget? child,
      String? title = '',
      String? message = '',
      bool? useSingleAction = false,
      Function? actionRight,
      Function? actionLeft,
      Function? singleAction,
      Color borderColor = AppColors.goldFirst,
      TextStyle? titleTextStyle,
      TextStyle? messageTextSyle,
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
            child: child ??
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? "Title",
                      style: titleTextStyle ??
                          AppFonts.promptM24
                              .copyWith(color: AppColors.goldFirst),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Text(
                        message ?? "Message",
                        style: messageTextSyle ??
                            AppFonts.promptL18
                                .copyWith(color: AppColors.whiteFirst),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!(useSingleAction == true))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ButtonWidget(
                              width: _size.width * 0.6 / 2,
                              heigth: _size.height * 0.07,
                              backgroundColor: AppColors.goldFirst,
                              text: "Aceptar",
                              textStyle: AppFonts.promptM15
                                  .copyWith(color: AppColors.whiteFirst),
                              onPressed: actionLeft?.call() ??
                                  () => Navigator.pop(context)),
                          SizedBox(
                            width: _size.width * 0.05,
                          ),
                          ButtonWidget(
                              width: _size.width * 0.6 / 2,
                              heigth: _size.height * 0.07,
                              backgroundColor: AppColors.goldFirst,
                              text: "Cancelar",
                              textStyle: AppFonts.promptM15
                                  .copyWith(color: AppColors.whiteFirst),
                              onPressed: actionRight?.call() ??
                                  () => Navigator.pop(context)),
                        ],
                      )
                    else
                      ButtonWidget(
                          width: _size.width * 0.65,
                          heigth: _size.height * 0.07,
                          backgroundColor: AppColors.goldFirst,
                          text: "Cerrar",
                          borderColor: Colors.transparent,
                          textStyle: AppFonts.promptM15
                              .copyWith(color: AppColors.whiteFirst),
                          onPressed: singleAction?.call() ??
                              () => Navigator.pop(context)),
                  ],
                ),
          ));
        });
    await future.then((void value) => onClose?.call());
    return future;
  }

  Future<T?> dialogSecondary<T>(
      {BuildContext? context,
      Widget? child,
      String? title = '',
      String? message = '',
      bool? useSingleAction = false,
      void Function()? actionRight,
      void Function()? actionLeft,
      void Function()? singleAction,
      Color? borderColor = Colors.white,
      TextStyle? titleTextStyle,
      TextStyle? messageTextSyle,
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

  Future<T?> modalDefault<T>({
    required Widget? content,
    String? title,
    TextStyle? titleStyle,
    bool showTitle = true,
    bool showCloseIcon = true,
    Future<T?>? Function()? onCloseModal,
  }) async {
    return await modal<T>(
        onCloseModal: (_) async => onCloseModal?.call(),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 + 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (showTitle) ...[
                    const SizedBox(
                      height: 34.78,
                    ),
                    Text(title ?? '', style: titleStyle ?? AppFonts.promptM17, textAlign: TextAlign.center,),
                    const SizedBox(
                      height: 18.11,
                    ),
                  ] else
                    const SizedBox(
                      height: 30,
                    ),
                  content ?? Container(),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            if (showCloseIcon)
              Container(
                width: _size.width,
                height: 102,
                padding: const EdgeInsets.all(5),
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(MdiIcons.close),
                    onPressed: () => Navigator.of(_context).pop()),
              ),
            const Positioned.fill(
              top: 10,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: ModalDecorationWidget()),
            )
          ],
        ));
  }

  void toast(
      {BuildContext? context,
      Widget? content,
      Duration? duration,
      String? messaje,
      double? top,
      double? left,
      double? right,
      double? bottom = 20,
      Color? background = const Color(0xff646464),
      Color? textColor = Colors.white,
      TextStyle? style}) async {
    Widget defaultContent = SizedBox(
      width: _size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            constraints: BoxConstraints(
              maxWidth: _size.width * 0.9,
              minWidth: _size.width * 0.1,
            ),
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(20)),
            child: Text(
              messaje ?? '',
              style: style ?? TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );

    OverlayState? overlayState = Overlay.of(_context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => _OverlayWidget(
              content: content ?? defaultContent,
              top: top,
              left: left,
              bottom: bottom,
              right: right,
              width: _size.width,
              type: OverlayType.toast,
              duration: duration ?? const Duration(milliseconds: 2500),
              background: background,
            ));
    overlayState.insert(overlayEntry);
    Future.delayed(const Duration(milliseconds: 3500)).then((_) {
      overlayEntry.remove();
    });
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

  void notification(
    String? title, {
    String? subtitle,
    Widget? content,
    double? top,
    double? left,
    double? right,
    double? bottom,
    Widget? icon,
    Duration? duration,
    Duration? remove,
    void Function()? onTap,
    Color? background = Colors.white,
    Color? titleTextColor = Colors.black,
    TextStyle? style,
    Color? subTitleTextColor = Colors.black,
    TextStyle? subTitleStyle,
    NotificationPosition? notificationPosition = NotificationPosition.top,
    NotificationDisplacement? notificationDisplacement =
        NotificationDisplacement.none,
    EdgeInsets? padding,
    EdgeInsets? margin,
  }) {
    OverlayState? overlayState = Overlay.of(_context);
    double? top, left, right, bottom;
    switch (notificationPosition) {
      case NotificationPosition.top:
        top = 10;
        left = null;
        right = null;
        bottom = null;
        break;
      case NotificationPosition.bottom:
        top = null;
        left = null;
        right = null;
        bottom = 10;
        break;
      default:
    }
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => _OverlayWidget(
              top: top ?? top,
              left: left ?? left,
              bottom: bottom ?? bottom,
              right: right ?? right,
              duration: duration ?? const Duration(seconds: 5),
              notificationPosition: notificationPosition,
              type: OverlayType.notification,
              notificationDisplacement: notificationDisplacement,
              width: margin == null ? _size.width * 0.95 : _size.width,
              padding: padding,
              margin: margin,
              onTap: onTap,
              background: background,
              content: content ??
                  Container(
                    color: background,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            icon ?? const SizedBox(),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                                child: Text(
                              title ?? "",
                              style: style ??
                                  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: titleTextColor ?? Colors.black),
                            )),
                          ],
                        ),
                        if (subtitle != null && subtitle != "")
                          const SizedBox(
                            height: 5,
                          ),
                        if (subtitle != null && subtitle != "")
                          Row(
                            children: [
                              Flexible(
                                  child: Text(
                                subtitle,
                                style: subTitleStyle ??
                                    TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color:
                                            subTitleTextColor ?? Colors.black),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                            ],
                          ),
                      ],
                    ),
                  ),
            ));
    overlayState.insert(overlayEntry);
    Future.delayed(remove ?? const Duration(seconds: 10)).then((_) {
      overlayEntry.remove();
    });
  }

  void eitherError(Failure l) {
    return notification("¡Ups, algo va mal!",
        subtitle: l.message,
        icon: const Icon(
          Icons.bug_report_outlined,
          color: AppColors.blackFirst,
        ));
  }

  void successNotification(String message, {String? subtitle}) {
    return notification(message,
        subtitle: subtitle,
        icon: SvgPicture.asset(
          Assets.icons.loadedIcon,
          width: 20,
          height: 20,
          color: AppColors.greenAccentFirst,
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

class _OverlayWidget extends StatefulWidget {
  final Widget? content;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  final Duration? duration;
  final Duration? reverse;
  final OverlayType? type;
  final void Function()? onTap;
  final NotificationPosition? notificationPosition;
  final NotificationDisplacement? notificationDisplacement;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? background;
  const _OverlayWidget(
      {required this.content,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.duration,
      this.width,
      this.type,
      this.onTap,
      this.padding,
      this.margin,
      this.background,
      this.reverse,
      this.height,
      this.notificationPosition = NotificationPosition.top,
      this.notificationDisplacement = NotificationDisplacement.none});
  @override
  _OverlayWidgetState createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<_OverlayWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case OverlayType.dialog:
      case OverlayType.modal:
      case OverlayType.toast:
        controller = AnimationController(
            duration: const Duration(milliseconds: 250), vsync: this);
        animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
        animation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(widget.duration ?? const Duration(seconds: 1), () {
              if (mounted && controller.isCompleted == true) {
                controller.reverse();
              }
            });
          }
        });
        break;
      case OverlayType.notification:
        Offset begin;
        Offset end;
        switch (widget.notificationPosition) {
          case NotificationPosition.top:
            switch (widget.notificationDisplacement) {
              case NotificationDisplacement.leftToRight:
                begin = const Offset(-2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              case NotificationDisplacement.rightToLeft:
                begin = const Offset(2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              default:
                begin = const Offset(0.0, -2.0);
                end = const Offset(0.0, 0.0);
            }
            break;
          case NotificationPosition.bottom:
            switch (widget.notificationDisplacement) {
              case NotificationDisplacement.leftToRight:
                begin = const Offset(-2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              case NotificationDisplacement.rightToLeft:
                begin = const Offset(2.0, 0.0);
                end = const Offset(0.0, 0.0);
                break;
              default:
                begin = const Offset(0.0, 2.0);
                end = const Offset(0.0, 0.0);
            }
            break;
          default:
            begin = const Offset(0.0, 0.0);
            end = const Offset(0.0, 0.0);
        }
        controller = AnimationController(
            duration: const Duration(milliseconds: 1300), vsync: this);
        _offsetAnimation = Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ));
        _offsetAnimation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(widget.duration ?? const Duration(seconds: 1), () {
              if (mounted && controller.isCompleted == true) {
                controller.reverse();
              }
            });
          }
        });
        break;
      default:
    }
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case OverlayType.dialog:
        break;
      case OverlayType.modal:
        break;
      case OverlayType.toast:
        return Positioned.fill(
            top: widget.top,
            left: widget.left,
            right: widget.right,
            bottom: widget.bottom,
            child: Align(
              alignment: Alignment.center,
              child: FadeTransition(
                  opacity: animation,
                  child: GestureDetector(
                      onTap: () {
                        controller.reverse();
                      },
                      child: SafeArea(
                        child: Material(
                            color: Colors.transparent, child: widget.content),
                      ))),
            ));
      case OverlayType.notification:
        return Positioned.fill(
            top: widget.top,
            left: widget.left,
            right: widget.right,
            bottom: widget.bottom,
            child: Align(
                alignment: Alignment.center,
                child: SlideTransition(
                    position: _offsetAnimation,
                    child: GestureDetector(
                        onVerticalDragUpdate: (_) {
                          controller.reverse();
                          widget.onTap?.call();
                        },
                        onTap: () {
                          controller.reverse();
                          widget.onTap?.call();
                        },
                        child: SafeArea(
                          child: Material(
                              color: Colors.transparent,
                              child: Container(
                                  width: widget.width,
                                  height: widget.height,
                                  margin: widget.margin ??
                                      EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05 /
                                              2),
                                  padding: widget.padding ??
                                      const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 15.0),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: const Color(0xFFDBDBDB)),
                                      borderRadius: BorderRadius.circular(16),
                                      color: widget.background ??
                                          Colors.transparent),
                                  child: widget.content)),
                        )))));
      default:
        return Container();
    }
    return Container();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum NotificationPosition { top, bottom }

enum NotificationDisplacement { leftToRight, rightToLeft, none }

enum OverlayType { dialog, modal, toast, notification }
