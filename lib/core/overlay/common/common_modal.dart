import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/modal_decoration_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CommonChildModal extends StatelessWidget with BaseWidget {
  final Widget child;
  final String? title;
  final TextStyle? titleStyle;
  final bool showTitle;
  final bool showCloseIcon;
  const CommonChildModal({
    Key? key,
    required this.child,
    this.title,
    this.titleStyle,
    this.showTitle = true,
    this.showCloseIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                Text(
                  title ?? '',
                  style: titleStyle ?? FontsFoundation.primaryM17,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 18.11,
                ),
              ] else
                const SizedBox(
                  height: 30,
                ),
              child,
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        if (showCloseIcon)
          Container(
            width: size.width,
            height: 102,
            padding: const EdgeInsets.all(5),
            alignment: Alignment.topRight,
            child: IconButton(
                icon: const Icon(MdiIcons.close),
                onPressed: () => Navigator.of(context).pop()),
          ),
        const Positioned.fill(
          top: 10,
          child: Align(
              alignment: Alignment.topCenter, child: ModalDecorationWidget()),
        )
      ],
    );
  }
}