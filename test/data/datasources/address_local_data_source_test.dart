import 'package:dvp_technical_test/core/env.dart';
import 'package:dvp_technical_test/features/data/datasource/address_local_data_source.dart';
import 'package:dvp_technical_test/features/data/datasource/auth_local_data_source.dart';
import 'package:dvp_technical_test/features/data/models/address_model.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
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

  const tAddressModel = AddressModel(
    id: 1,
    name: "Mollit tempor id duis officia cillum velit excepteur pariatur.",
    selected: true,
  );

  const tAddressEntity = AddressEntity(
    id: 1,
    name: "Mollit tempor id duis officia cillum velit excepteur pariatur.",
    selected: true,
  );

  setUp(() async {
    await Env.load(fileName: Assets.env.env);
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
    sharedPreferences = await SharedPreferences.getInstance();
    authLocalDataSource = AuthLocalDataSourceImpl(sharedPreferences: sharedPreferences);
    addressLocalDataSource = AddressLocalDataSourceImpl();
  });

  group("save Address", () {
    test("should create a address", () async {
      final result = await addressLocalDataSource.saveAddress(tAddressModel);
      expect(result, equals(true));
    });
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