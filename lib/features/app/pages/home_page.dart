import 'package:flutter/material.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:dvp_technical_test/core/page/base_bloc_state.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:dvp_technical_test/features/app/blocs/global/global_session_bloc/global_session_bloc.dart';
import 'package:dvp_technical_test/features/app/blocs/home_bloc/home_bloc.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_app_bar.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  static const route = "/HomePage";
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseBlocState<HomePage, HomeBloc> {
  final gBloc = sl<GlobalSessionBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50.0,
              ),
              Text(
                '${l10n.homeTitle} ${gBloc.user?.name}!', //+ Application().user.name + '!',
                style: AppFonts.promptR24,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  l10n.homeSubtitle,
                  style: AppFonts.promptR16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
