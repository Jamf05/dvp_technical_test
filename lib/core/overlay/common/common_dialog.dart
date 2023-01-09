import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class CommonChildDialog extends StatelessWidget with BaseWidget {
  final String? title;
  final String? message;
  final bool? useSingleAction;
  final Function? actionRight;
  final Function? actionLeft;
  final Function? singleAction;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextSyle;

  const CommonChildDialog({
    Key? key,
    this.title = '',
    this.message = '',
    this.useSingleAction = false,
    this.actionRight,
    this.actionLeft,
    this.singleAction,
    this.titleTextStyle,
    this.messageTextSyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? "Title",
          style: titleTextStyle ??
              FontsFoundation.primaryM24,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Text(
            message ?? "Message",
            style: messageTextSyle ??
                FontsFoundation.primaryL18,
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
                  width: size.width * 0.6 / 2,
                  heigth: size.height * 0.07,
                  backgroundColor: ColorsToken.black,
                  text: "Aceptar",
                  textStyle:
                      FontsFoundation.primaryM15,
                  onPressed:
                      actionLeft?.call() ?? () => Navigator.pop(context)),
              SizedBox(
                width: size.width * 0.05,
              ),
              ButtonWidget(
                  width: size.width * 0.6 / 2,
                  heigth: size.height * 0.07,
                  backgroundColor: ColorsToken.black,
                  text: "Cancelar",
                  textStyle:
                      FontsFoundation.primaryM15,
                  onPressed:
                      actionRight?.call() ?? () => Navigator.pop(context)),
            ],
          )
        else
          ButtonWidget(
              width: size.width * 0.65,
              heigth: size.height * 0.07,
              backgroundColor: ColorsToken.black,
              text: "Cerrar",
              borderColor: Colors.transparent,
              textStyle:
                  FontsFoundation.primaryM15,
              onPressed: singleAction?.call() ?? () => Navigator.pop(context)),
      ],
    );
  }
}
