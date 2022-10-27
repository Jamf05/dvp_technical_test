import 'package:dvp_technical_test/core/page/base_bloc_state.dart';
import 'package:dvp_technical_test/features/app/blocs/address_detail_bloc/address_detail_bloc.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_invisible_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/custom_text_field.dart';
import 'package:dvp_technical_test/features/app/pages/address_detail_page/widgets/address_detail_title_widget.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum AddressDetailAction { edit, create }

class AddressDetailPage extends StatefulWidget {
  static const route = "/AddressDetailPage";
  final AddressEntity? address;
  final AddressDetailAction action;
  const AddressDetailPage({Key? key, required this.action, this.address})
      : super(key: key);

  @override
  State<AddressDetailPage> createState() => _AddressDetailPageState();
}

class _AddressDetailPageState
    extends BaseBlocState<AddressDetailPage, AddressDetailBloc> {
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
    bloc.initState(action: widget.action, address: widget.address);
    super.onInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomInvisibleAppBar(
          actions: actions,
        ),
        body: BlocListener<AddressDetailBloc, AddressDetailState>(
            listener: (context, state) {
              if (state is AddressDetailFailureState) {
                show.eitherError(state.failure);
              }
            },
            bloc: bloc,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  AddressDetailTitleWidget(action: widget.action),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CustomTextField(
                    initialValue: widget.address?.name,
                    labelText: l10n.addressWord,
                    validator: (_) => bloc.addressInput.invalid
                        ? l10n.invalidFieldWord
                        : null,
                    onChanged: (String v) =>
                        bloc.addressInput = bloc.addressInput.copyWith(v),
                  ),
                  const Spacer(),
                  BlocBuilder<AddressDetailBloc, AddressDetailState>(
                    bloc: bloc,
                    buildWhen: (previous, current) =>
                        current is AddressDetailUpdateButtonState,
                    builder: (context, state) {
                      return ButtonWidget(
                          disable: !bloc.addressInput.valid,
                          loading: bloc.sendingData,
                          padding: const EdgeInsets.only(bottom: 10),
                          text: l10n.saveWord,
                          onPressed: () => bloc.runBasedOn(nav, show, l10n));
                    },
                  )
                ],
              ),
            )));
  }
}
