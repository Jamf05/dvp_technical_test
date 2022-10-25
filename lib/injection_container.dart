import 'package:dvp_technical_test/features/domain/usecases/get_user_data_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dvp_technical_test/features/app/blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:dvp_technical_test/features/app/blocs/home_bloc/home_bloc.dart';
import 'package:dvp_technical_test/features/app/blocs/location_bloc/location_bloc.dart';
import 'package:dvp_technical_test/features/app/blocs/splash_bloc/splash_bloc.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_local_data_source.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_remote_data_source.dart';
import 'package:dvp_technical_test/features/data/datasource/location_remote_datasource.dart';
import 'package:dvp_technical_test/features/data/datasource/user_remote_data_source.dart';
import 'package:dvp_technical_test/features/data/repositories/auth_repository_impl.dart';
import 'package:dvp_technical_test/features/data/repositories/location_remote_datasource_impl.dart';
import 'package:dvp_technical_test/features/data/repositories/user_repository_impl.dart';
import 'package:dvp_technical_test/features/domain/repositories/auth_repository.dart';
import 'package:dvp_technical_test/features/domain/repositories/location_repository.dart';
import 'package:dvp_technical_test/features/domain/repositories/user_repository.dart';
import 'package:dvp_technical_test/features/domain/usecases/check_authenticated_use_case.dart';
import 'package:dvp_technical_test/features/domain/usecases/confirm_account_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_current_user_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_list_cities_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_list_countries_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/log_in_use_case.dart';
import 'package:dvp_technical_test/features/domain/usecases/log_out_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/register_user_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/reject_user_confirmation_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/resend_confirmation_code_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/sign_up_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**
   * Blocs
   */

  sl.registerFactory(
      () => SplashBloc(checkAuthenticated: sl(), rejectUserConfirmation: sl()));
  sl.registerFactory(() => HomeBloc(userUseCase: sl(), logOutUseCase: sl()));
  sl.registerFactory(() => DateSelectionBloc());
  sl.registerFactory(() =>
      LocationBloc(getListCountriesUsecase: sl(), getListCitiesUseCase: sl()));

  /**
   * Use Cases
   */

  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => LogInUseCase(sl()));
  sl.registerLazySingleton(() => CheckAuthenticatedUseCase(sl()));
  sl.registerLazySingleton(() => RejectUserConfirmationUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmAccountUsecase(sl()));
  sl.registerLazySingleton(() => ResendConfirmatioCodeUsecase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUsecase(sl()));
  sl.registerLazySingleton(() => GetListCountriesUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
  sl.registerLazySingleton(() => GetListCitiesUsecase(sl()));
  sl.registerLazySingleton(() => GetUserDataUseCase(sl()));

  /** 
   * Repositories
   */

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: sl(), authLocalDataSource: sl()));
  sl.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(remoteDataSource: sl()));

  /**
   * Data Sources
   */
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<LocationRemoteDataSource>(
      () => LocationRemoteDataSourceImpl());

  /**
   * Externals
   */
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
