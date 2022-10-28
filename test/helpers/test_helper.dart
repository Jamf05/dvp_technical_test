import 'package:dvp_technical_test/features/data/datasource/address_local_data_source.dart';
import 'package:dvp_technical_test/features/domain/repositories/address_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  AddressRepository,
  AddressLocalDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
