import 'package:dvp_technical_test/core/page/base_stateless.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_invisible_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/custom_text_field.dart';
import 'package:dvp_technical_test/features/app/pages/address_detail_page/widgets/address_detail_title_widget.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum AddressDetailAction { edit, create }

class AddressDetailPage extends BaseStateless {
  static const route = "/AddressDetailPage";
  final AddressEntity? address;
  final AddressDetailAction action;
  const AddressDetailPage({Key? key, required this.action, this.address}) : super(key: key);

  List<Widget> get actions => [
        IconButton(
            onPressed: () =>
                AppTheme.selected.value = AppTheme.reverseBlueTheme,
            icon: Icon(
                isDarkTheme
                    ? Icons.wb_sunny_outlined
                    : MdiIcons.weatherNightPartlyCloudy,
                color:
                    isDarkTheme ? AppColors.whiteFirst : AppColors.blackFirst))
      ];
      
  @override
  Widget build(BuildContext context) {
    BaseStateless.init(context);
    return Scaffold(
        appBar: CustomInvisibleAppBar(actions: actions,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              AddressDetailTitleWidget(action: action),
              SizedBox(
                height: size.height * 0.1,
              ),
              CustomTextField(
                initialValue: address?.name,
                labelText: l10n.addressWord,
                validator: (_) => null,
                onChanged: (String v) => null,
              ),
              const Spacer(),
              ButtonWidget(
                  padding: const EdgeInsets.only(bottom: 10),
                  text: l10n.saveWord,
                  onPressed: () => Nav.of(context).back())
            ],
          ),
        ));
  }
}
