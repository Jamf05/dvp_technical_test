import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/circular_progress_indicator_widget.dart';

class LoadingWidget extends StatelessWidget with BaseWidget {
  final String message;
  const LoadingWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BaseWidget.init(context);
    return SizedBox(
    width: size.width * 0.5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        const CircularProgressWidget(
            width: 101, height: 101, heightCPI: 101, widthCPI: 101),
        const SizedBox(
          height: 50,
        ),
        Text(
          message,
          style: AppFonts.promptB20,
        )
      ],
    ),
  );
}
}