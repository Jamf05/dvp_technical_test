import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:flutter/material.dart';

class EmptyItemWidget extends StatelessWidget with BaseWidget {
  final String message;
  final IconData? icon;
  final String? svg;
  const EmptyItemWidget({Key? key, required this.message, this.icon, this.svg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BaseWidget.init(context);
    return Container(
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,
              size: 200,
              color: isDarkTheme
                  ? AppColors.whiteFirst.withOpacity(0.15)
                  : AppColors.greyFirst.withOpacity(0.15)),
          Text(message,
              textAlign: TextAlign.center,
              style: AppFonts.promptR18.copyWith(
                  color: isDarkTheme
                      ? AppColors.whiteFirst.withOpacity(0.15)
                      : AppColors.greyFirst.withOpacity(0.15))),
        ],
      ),
    );
  }
}
