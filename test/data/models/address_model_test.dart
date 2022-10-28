import 'dart:convert';

import 'package:dvp_technical_test/features/data/models/address_model.dart';
import 'package:dvp_technical_test/features/domain/entities/address_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/dummy_data.dart';
import '../../helpers/json_reader.dart';

void main() {
  const tAddressModel = AddressModel(
    id: 1,
    name: "Mollit tempor id duis officia cillum velit excepteur pariatur.",
    selected: true,
  );

  const tAddressModelCopyWithModel = AddressModel(
    id: 5,
    name:
        "Lorem consectetur cupidatat eu occaecat ad anim ex velit enim nostrud non velit laboris.",
    selected: false,
  );

  const tAddressEntity = AddressEntity(
    id: 1,
    name: "Mollit tempor id duis officia cillum velit excepteur pariatur.",
    selected: true,
  );

  group('cast', () {
    test(
      'should an address entity become a address model ',
      () async {
        // assert
        final result = AddressModel.cast(tAddressEntity);
        expect(result, equals(tAddressModel));
      },
    );
  });

  group('copy with model', () {
    test(
      'should copy model to another model',
      () async {
        // assert
        final result = tAddressModel.copyWithModel(
          id: 5,
          name:
              "Lorem consectetur cupidatat eu occaecat ad anim ex velit enim nostrud non velit laboris.",
          selected: false,
        );
        expect(result, equals(tAddressModelCopyWithModel));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(
          JsonHelpers.readJson(DummyData.addressResponse),
        );

        // act
        final result = AddressModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tAddressModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = tAddressModel.toJson();

        // assert
        final expectedJsonMap = {
          "id": 1,
          "selected": true,
          "name": "Mollit tempor id duis officia cillum velit excepteur pariatur.",
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
