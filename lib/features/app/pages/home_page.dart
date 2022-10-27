import 'package:dvp_technical_test/features/app/bindings/home_binding.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_invisible_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/button_widget.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/custom_text_field.dart';
import 'package:dvp_technical_test/features/app/pages/address_list_page/address_list_page.dart';
import 'package:flutter/material.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:dvp_technical_test/core/page/base_bloc_state.dart';
import 'package:dvp_technical_test/features/app/blocs/global/global_session_bloc/global_session_bloc.dart';
import 'package:dvp_technical_test/features/app/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  static const route = "/HomePage";
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseBlocState<HomePage, HomeBloc> {
  final gBloc = sl<GlobalSessionBloc>();
  @override
  void dispose() {
    HomeBinding().dependencies();
    super.dispose();
  }

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
    return Scaffold(
      appBar: CustomInvisibleAppBar(
        leading: const SizedBox(),
        actions: actions,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50.0,
                ),
                Text(
                  '¡${l10n.helloWord}!',
                  style: AppFonts.promptR24,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    l10n.homeText1,
                    style: AppFonts.promptR16,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                CustomTextField(
                  labelText: l10n.nameWord,
                  validator: (_) =>
                      bloc.name.invalid ? l10n.invalidFieldWord : null,
                  onChanged: (String v) => bloc.name = bloc.name.copyWith(v),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                CustomTextField(
                  labelText: l10n.surnameWord,
                  validator: (_) =>
                      bloc.surName.invalid ? l10n.invalidFieldWord : null,
                  onChanged: (String v) =>
                      bloc.surName = bloc.surName.copyWith(v),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                CustomTextField(
                    readOnly: true,
                    controller: bloc.birthdayCtrl,
                    labelText: l10n.birthdayWord,
                    validator: (_) =>
                        bloc.birthday.invalid ? l10n.invalidFieldWord : null,
                    onChanged: (String _) {},
                    onTap: () async {
                      final picker = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now()
                              .add(const Duration(days: -360 * 100)),
                          initialDate: DateTime.now()
                              .add(const Duration(days: -360 * 18)),
                          lastDate: DateTime.now());
                      bloc.birthdayDate = picker;
                    }),
                SizedBox(
                  height: size.height * 0.015,
                ),
                CustomTextField(
                    readOnly: true,
                    labelText: l10n.addressWord,
                    suffixIcon: Icon(
                      Icons.chevron_right,
                      color: isDarkTheme
                          ? AppColors.whiteFirst
                          : AppColors.blackSecond,
                    ),
                    validator: (_) {},
                    onChanged: (_) {},
                    onTap: () => nav.to(const AddressListPage())),
              ],
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: BlocBuilder<HomeBloc, HomeState>(
                  bloc: bloc,
                  buildWhen: (previous, current) =>
                      current is UpdateButtonState,
                  builder: (context, state) {
                    return ButtonWidget(
                      visible:
                          WidgetsBinding.instance.window.viewInsets.bottom ==
                              0.0,
                      padding: const EdgeInsets.only(
                          left: 23, right: 23, bottom: 10),
                      disable: !bloc.validForm,
                      text: l10n.saveWord,
                      onPressed: () {},
                    );
                  },
                )),
          ),
          SizedBox(
            height: size.height,
          )
        ],
      ),
    );
  }
}
