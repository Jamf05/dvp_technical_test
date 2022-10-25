import 'package:flutter/material.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';

class EmptyItemWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  const EmptyItemWidget({Key? key, required this.message, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 200,
            color: Colors.white12,
          ),
          Text(message, textAlign: TextAlign.center, style: AppFonts.promptR18),
        ],
      ),
    );
  }
}
