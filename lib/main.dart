import 'dart:async';

import 'package:dvp_technical_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_technical_test/core/env.dart';
import 'package:dvp_technical_test/injection_container.dart';
import 'package:dvp_technical_test/features/app/app.dart';
import 'package:dvp_technical_test/core/bloc/bloc_observer.dart';
import 'package:dvp_technical_test/features/app/blocs/global/global_session_bloc/global_session_bloc.dart';

import 'package:dvp_technical_test/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.load(fileName: Assets.env.env);
  await di.init();
  sl.registerSingleton(GlobalSessionBloc());
  runZoned<Future<void>>(
    () async {
      Bloc.observer = CustomBlocObserver();
      runApp(const App());
    },
  );
}
