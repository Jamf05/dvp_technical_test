import 'package:flutter/widgets.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';

class ModalDecorationWidget extends StatelessWidget {
  const ModalDecorationWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 4,
      decoration: BoxDecoration(color: AppColors.greySecond, borderRadius: BorderRadius.circular(6)),
    );
  }
}