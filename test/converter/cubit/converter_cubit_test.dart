import 'package:coin_repository/coin_repository.dart' as coin_repository;
import 'package:crypto_converter/converter/cubit/cubit.dart';
import 'package:crypto_converter/converter/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/hydrated_bloc.dart';

class MockCoinRepository extends Mock implements coin_repository.CoinRepository {}

class MockExchangeRate extends Mock implements coin_repository.ExchangeRate {}

void main() {
  initHydratedStorage();
  group('ConverterCubit', () {
    late coin_repository.CoinRepository coinRepository;
    late coin_repository.ExchangeRate bitcoin;
    late coin_repository.ExchangeRate ethereum;
    late coin_repository.ExchangeRate litecoin;
    late coin_repository.ExchangeRate dogecoin;
    late List<coin_repository.ExchangeRate> exchangeRates;
    late ConverterCubit converterCubit;

    setUp(() async {
      bitcoin = MockExchangeRate();
      ethereum = MockExchangeRate();
      litecoin = MockExchangeRate();
      dogecoin = MockExchangeRate();
      exchangeRates = [bitcoin, ethereum, litecoin, dogecoin];
      coinRepository = MockCoinRepository();
      when(() => coinRepository.getExchangeRate('BTC', any())).thenAnswer((_) async => bitcoin);
      when(() => coinRepository.getExchangeRate('ETH', any())).thenAnswer((_) async => ethereum);
      when(() => coinRepository.getExchangeRate('LTC', any())).thenAnswer((_) async => litecoin);
      when(() => coinRepository.getExchangeRate('DOGE', any())).thenAnswer((_) async => dogecoin);
      converterCubit = ConverterCubit(coinRepository);
    });

    test('initial state is correct', () {
      converterCubit = ConverterCubit(coinRepository);
      expect(converterCubit.state, ConverterState());
    });
  });
}
