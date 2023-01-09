import 'package:dvp_technical_test/core/design/design.dart';
import 'package:flutter/material.dart';

class InputTimeWidget extends StatelessWidget {
  final String label;
  final String time;
  final void Function()? onTap;
  final double? width;
  final double? height;
  const InputTimeWidget({
    Key? key,
    required this.label,
    required this.time,
    required this.onTap,
    this.width = 130,
    this.height = 110,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: FontsFoundation.primaryB16,
            ),
            const Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  time,
                  style: FontsFoundation.primaryR18,
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
            const Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}