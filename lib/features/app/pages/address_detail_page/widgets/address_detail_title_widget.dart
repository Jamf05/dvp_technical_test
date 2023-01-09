import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:dvp_technical_test/features/app/pages/address_detail_page/address_detail_page.dart';
import 'package:flutter/material.dart';

class AddressDetailTitleWidget extends StatelessWidget with BaseWidget {
  final AddressDetailAction action;
  const AddressDetailTitleWidget({Key? key, required this.action})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    BaseWidget.init(context);
    String title = "";
    switch (action) {
      case AddressDetailAction.edit:
        title = "${l10n.editWord} ${l10n.addressWord.toLowerCase()}";
        break;
      case AddressDetailAction.create:
        title = "${l10n.createWord} ${l10n.addressWord.toLowerCase()}";
        break;
    }
    return Text(
      title,
      style: FontsFoundation.primaryR24,
      textAlign: TextAlign.center,
    );
  }
}
