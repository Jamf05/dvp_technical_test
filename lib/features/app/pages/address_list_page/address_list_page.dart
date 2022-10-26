import 'package:dvp_technical_test/core/page/base_stateless.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_invisible_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:dvp_technical_test/features/app/pages/address_detail_page/address_detail_page.dart';
import 'package:dvp_technical_test/features/app/pages/address_list_page/widgets/address_item_widget.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';

class AddressListPage extends BaseStateless {
  static const route = "/AddressListPage";
  const AddressListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BaseStateless.init(context);
    const example = [
      AddressEntity(
          id: 1,
          name:
              "Commodo quis nisi dolor id mollit et tempor sunt eiusmod proident.",
          principal: true),
      AddressEntity(
        id: 2,
        name: "Ex sunt eu ullamco ex ut aliqua id.",
      ),
      AddressEntity(
          id: 3,
          name: "Voluptate cupidatat cupidatat pariatur do et esse sunt."),
    ];
    return Scaffold(
        appBar: CustomInvisibleAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Text(
                'Mis direcciones',
                style: AppFonts.promptR24,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              ...example.map((e) => AddressItemWidget(
                    data: e,
                    onDelete: (AddressEntity address) {},
                    onEdit: (AddressEntity address) =>
                        Nav.of(context).to(const AddressDetailPage(
                      action: AddressDetailAction.edit,
                    )),
                  )),
              const Spacer(),
              ButtonWidget(
                  padding: const EdgeInsets.only(bottom: 10),
                  text: "Nueva",
                  onPressed: () => Nav.of(context).to(const AddressDetailPage(
                        action: AddressDetailAction.create,
                      )))
            ],
          ),
        ));
  }
}
