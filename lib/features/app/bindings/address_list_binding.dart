import 'package:dvp_technical_test/core/binding/bindings_interface.dart';
import 'package:dvp_technical_test/features/app/blocs/address_list_bloc/address_list_bloc.dart';
import 'package:dvp_technical_test/injection_container.dart';

class AddressListBinding extends Bindings {
  @override
  void dependencies() {
    sl.registerLazySingleton(() => AddressListBloc(
        getListAddressUsecase: sl(),
        setAddressUseCase: sl(),
        removeAddressUseCase: sl()));
  }

  @override
  void dispose() {
    sl.unregister<AddressListBloc>();
  }
}
