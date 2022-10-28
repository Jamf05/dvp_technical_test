import 'package:dvp_technical_test/core/env.dart';
import 'package:dvp_technical_test/features/data/datasource/address_local_data_source.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_local_data_source.dart';
import 'package:dvp_technical_test/gen/assets.gen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


void main() {
  // Init ffi loader if needed.
  late SharedPreferences sharedPreferences;
  late AuthLocalDataSourceImpl authLocalDataSource;
  late AddressLocalDataSourceImpl addressLocalDataSource;

  setUp(() async {
    await Env.load(fileName: Assets.env.env);
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
    sharedPreferences = await SharedPreferences.getInstance();
    authLocalDataSource = AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences);
    addressLocalDataSource = AddressLocalDataSourceImpl(authLocalDataSource: authLocalDataSource);
  });

  group('get list address', () {
    test(
      'should return list address when a call to data source is successful',
      () async {
        // act
        final result = await addressLocalDataSource.getListAddress();

        // assert
        expect(result, equals([]));
      },
    );
  });
}