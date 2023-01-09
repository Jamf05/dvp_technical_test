import 'package:dvp_technical_test/core/widget/base_widget.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressItemWidget extends StatelessWidget with BaseWidget {
  final AddressEntity data;
  final void Function(AddressEntity address) onEdit;
  final void Function(AddressEntity address) onDelete;
  final void Function(AddressEntity address) onSelecting;
  AddressItemWidget(
      {Key? key,
      required this.data,
      required this.onEdit,
      required this.onDelete,
      required this.onSelecting,
  })
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
              icon: SvgPicture.asset(
                AssetsToken.icons.mapPin,
                color: (data.selected == true)
                    ? ColorsFoundation.primary
                    : isDarkTheme
                        ? ColorsToken.white
                        : ColorsToken.gray300,
              ),
              onPressed: () async => onSelecting.call(data),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.55,
                    child:
                        Text(data.name ?? '', style: FontsFoundation.primaryL14),
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
                            child: SvgPicture.asset(AssetsToken.icons.editIcon,
                                color: isDarkTheme
                                    ? ColorsToken.white
                                    : ColorsToken.gray300),
                            onTap: () => onEdit.call(data)),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            child: SvgPicture.asset(AssetsToken.icons.deleteIcon,
                                color: isDarkTheme
                                    ? ColorsToken.white
                                    : ColorsToken.gray300),
                            onTap: () => onDelete.call(data)),
                      ],
                    );
                  }
                  return InkWell(
                      child: SizedBox(
                        width: 30,
                        child: SvgPicture.asset(
                          AssetsToken.icons.dotsVerticalIcon,
                          color: isDarkTheme
                              ? ColorsToken.white
                              : ColorsToken.black,
                        ),
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
