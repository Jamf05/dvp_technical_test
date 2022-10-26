import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatelessWidget with BaseWidget {
  final T option;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  const DropdownWidget({
    Key? key,
    required this.option,
    required this.items,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
      width: size.width * 0.6,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DropdownButton<T>(
        isExpanded: true,
        items: items,
        value: option,
        onChanged: onChanged,
      ));
}
}