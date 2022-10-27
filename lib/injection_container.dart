import 'package:dvp_technical_test/core/database/collections_name.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:dvp_technical_test/features/domain/entities/user_entity.dart';
import 'package:dvp_technical_test/features/domain/usecases/get_user_data_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/register_user_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:dvp_technical_test/features/domain/usecases/get_current_user_usecase.dart';
import 'package:dvp_technical_test/features/domain/usecases/reject_user_confirmation_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**
   * Blocs
   */

  sl.registerFactory(
      () => SplashBloc(checkAuthenticated: sl(), rejectUserConfirmation: sl()));

  /**
   * Use Cases
   */

  sl.registerLazySingleton(() => CheckAuthenticatedUseCase(sl()));
  sl.registerLazySingleton(() => RejectUserConfirmationUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUsecase(sl()));
  sl.registerLazySingleton(() => SetUserUseCase(sl()));
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
  await Hive.initFlutter();

  /**
   * Adapters
   */
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(AddressEntityAdapter());

  /**
   * Open Box
   */
  await Hive.openBox<UserEntity>(HiveCollections.user);
  await Hive.openBox<AddressEntity>(HiveCollections.address);
}
