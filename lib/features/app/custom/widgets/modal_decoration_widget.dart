import 'package:flutter/widgets.dart';
import 'package:dvp_technical_test/core/design/design.dart';

class ModalDecorationWidget extends StatelessWidget {
  const ModalDecorationWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 4,
      decoration: BoxDecoration(color: ColorsToken.gray900, borderRadius: BorderRadius.circular(6)),
    );
  }
}