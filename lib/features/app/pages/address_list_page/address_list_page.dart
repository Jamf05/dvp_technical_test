import 'package:dvp_technical_test/core/page/base_bloc_state.dart';
import 'package:dvp_technical_test/features/app/bindings/address_list_binding.dart';
import 'package:dvp_technical_test/features/app/blocs/address_list_bloc/address_list_bloc.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_invisible_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/circular_progress_indicator_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/empty_item_widget.dart';
import 'package:dvp_technical_test/features/app/pages/address_detail_page/address_detail_page.dart';
import 'package:dvp_technical_test/features/app/pages/address_list_page/widgets/address_item_widget.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddressListPage extends StatefulWidget {
  static const route = "/AddressListPage";
  const AddressListPage({super.key});

  @override
  State<AddressListPage> createState() => _AddressListPageState();
}

class _AddressListPageState
    extends BaseBlocState<AddressListPage, AddressListBloc> {
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
  void onInitState() {
    bloc.add(const AddressListUpdatePageEvent());
    super.onInitState();
  }

  @override
  void dispose() {
    AddressListBinding().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomInvisibleAppBar(
          actions: actions,
        ),
        bottomNavigationBar: BlocBuilder<AddressListBloc, AddressListState>(
          bloc: bloc,
          buildWhen: (previous, current) =>
              current is AddressListUpdateButtonState,
          builder: (context, state) {
            return ButtonWidget(
                loading: bloc.sendingData,
                padding: const EdgeInsets.only(
                    bottom: 10, left: 23, right: 23, top: 10),
                text: l10n.newAddressWord,
                onPressed: () => nav.to(const AddressDetailPage(
                      action: AddressDetailAction.create,
                    )));
          },
        ),
        body: BlocConsumer<AddressListBloc, AddressListState>(
          listener: (context, state) {
            if (state is AddressListFailureState) {
              show.eitherError(state.failure);
            }
          },
          bloc: bloc,
          buildWhen: (previous, current) =>
              current is AddressListUpdatePageState,
          builder: (context, state) {
            if (bloc.loadingPage) return const CircularProgressWidget();
            if (bloc.list.isEmpty) {
              return EmptyItemWidget(
                  message: l10n.addressListPageEmpty1,
                  icon: MdiIcons.cellphoneMarker);
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.only(left: 23, right: 33),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    l10n.addressListPageTitle,
                    style: AppFonts.promptR24,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  ...bloc.list.map((e) => AddressItemWidget(
                        data: e,
                        onSelecting: (AddressEntity address) => bloc.add(
                            AddressListOnSelectingEvent(address, l10n, show)),
                        onDelete: (AddressEntity address) =>
                            onDelete.call(address),
                        onEdit: (AddressEntity address) =>
                            nav.to(AddressDetailPage(
                          address: e,
                          action: AddressDetailAction.edit,
                        )),
                      )),
                ],
              ),
            );
          },
        ));
  }

  void onDelete(AddressEntity address) {
    show.modalDefault(
        title: l10n.confirmDeleteAddressPhrase,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              width: (size.width / 2) - 40,
              text: l10n.yesWord,
              onPressed: () async {
                bloc.add(AddressListOnRemoveEvent(address, l10n, show));
                nav.back();
              },
            ),
            ButtonWidget(
              width: (size.width / 2) - 40,
              text: l10n.noWord,
              onPressed: () async {
                nav.back();
              },
            ),
          ],
        ));
  }
}
