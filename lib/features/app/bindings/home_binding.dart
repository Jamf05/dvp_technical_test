import 'package:dvp_technical_test/core/binding/bindings_interface.dart';
import 'package:dvp_technical_test/features/app/blocs/home_bloc/home_bloc.dart';
import 'package:dvp_technical_test/injection_container.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    sl.registerLazySingleton(
        () => HomeBloc(getUserUseCase: sl(), setUserUseCase: sl()));
  }

  @override
  void dispose() {
    sl.unregister<HomeBloc>();
  }
}
