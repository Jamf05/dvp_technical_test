import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddressItemWidget extends StatelessWidget with BaseWidget {
  final AddressEntity data;
  final void Function(AddressEntity address) onEdit;
  final void Function(AddressEntity address) onDelete;
  AddressItemWidget(
      {Key? key,
      required this.data,
      required this.onEdit,
      required this.onDelete})
      : super(key: key);
  final ValueNotifier<bool> showMoreOptions = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                MdiIcons.mapMarker,
                color: (data.principal == true)
                    ? AppTheme.selected.primaryColor
                    : AppColors.greyFirst,
              ),
              onPressed: () async {
                // await addressCtrl.principalChange(data?.id);
                // if (!(widget.showMenu == true)) Get.back<bool>(result: true);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.55,
                    child: Text(
                      data.name.capitalize,
                      style: AppFonts.promptL14.copyWith(
                          color: data.principal == true
                              ? AppColors.blackFirst
                              : AppColors.greyFirst),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            ValueListenableBuilder(
                valueListenable: showMoreOptions,
                builder: (BuildContext context, bool value, Widget? child) {
                  if (value) {
                    return Row(
                      children: [
                        InkWell(
                            child: const Icon(
                              MdiIcons.pencilOutline,
                              color: AppColors.greyFirst,
                            ),
                            onTap: () => onEdit.call(data)),
                        const SizedBox(width: 5,),
                        InkWell(
                            child: const Icon(
                              MdiIcons.deleteOutline,
                              color: AppColors.greyFirst,
                            ),
                            onTap: () => onDelete.call(data)),
                      ],
                    );
                  }
                  return InkWell(
                      child: const Icon(
                        MdiIcons.dotsVertical,
                        color: AppColors.blackFirst,
                      ),
                      onTap: () => showMoreOptions.value = true);
                }),
          ],
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
