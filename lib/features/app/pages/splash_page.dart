import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_technical_test/core/page/base_bloc_state.dart';
import 'package:dvp_technical_test/features/app/blocs/splash_bloc/splash_bloc.dart';
import 'package:dvp_technical_test/features/app/pages/home_page.dart';
import 'package:dvp_technical_test/features/domain/entities/enums/session_status.dart';

class SplashPage extends StatefulWidget {
  static const route = "/SplashPage";
  const SplashPage({super.key});
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends BaseBlocState<SplashPage, SplashBloc> {
  @override
  void onInitState() {
    bloc.add(CheckAuthenticatedEvent());
    super.onInitState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is FailureState) {
            overlay.dialog(
                title: 'Advertencia',
                useSingleAction: true,
                message: (state.failure.message));
          }
        },
        child: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, state) {
            switch (state.runtimeType) {
              case CheckAuthenticatedState:
                redirect(bloc.sessionStatus);
                break;
              case RejectUserConfirmationState:
                redirect(SessionStatus.inactive);
                break;
            }
            return Center(
              child: Image.asset(
                Assets.splash.splashIconPng.path,
                width: size.width * 0.35,
                alignment: Alignment.center,
              ),
            );
          },
        ),
      ),
    );
  }

  Future<Timer> redirect(SessionStatus? session) async {
    return Timer(const Duration(milliseconds: 700), () {
      switch (session) {
        default:
          router.offAll(
            BlocProvider.value(
              value: bloc,
              child: const HomePage(),
            ),
          );
      }
    });
  }
}
