import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_converter/domain/converter/models/cryptocurrency.dart';
import 'package:crypto_converter/domain/converter/models/exchange_rate.dart';
import 'package:crypto_converter/domain/converter/usecases/list/list_exchange_rate_dto.dart';
import 'package:crypto_converter/infrastructure/coin_api/models/exchange_rate_data.dart';
import 'package:crypto_converter/presenter/converter/cubits/converter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/classes.dart';
import '../../../mocks/setup.dart';

void main() {
  late MockListExchangeRateUsecase usecase;

  setUpAll(() {
    initAppMocks();
    registerFallbacks();
  });

  setUp(() {
    usecase = MockListExchangeRateUsecase();
  });

  group('converter cubit tests', () {
    group('when converter cubit is created', () {
      blocTest<ConverterCubit, ConverterState>(
        'emits [] when nothing is called',
        build: () => ConverterCubit(usecase: usecase),
        expect: () => [],
      );
      // });
    });

    group('when fetch exchange rate is called', () {
      blocTest<ConverterCubit, ConverterState>(
        'emits [loading, success] states for successful call',
        setUp: () {
          when(() => usecase.execute(any())).thenAnswer(
            (_) async => const OutputListExchangeRateDto(
              exchangeRates: [
                ExchangeRate(
                  cryptocurrency: Bitcoin(),
                  currency: CurrencyType.brazilianReal,
                  rate: 123712937,
                ),
              ],
            ),
          );
        },
        build: () => ConverterCubit(usecase: usecase),
        seed: () => ConverterState(status: ConversionStatus.initial),
        act: (cubit) => cubit.fetchExchangeRates('BRL'),
        expect: () => [
          ConverterState(status: ConversionStatus.loading),
          ConverterState(
            status: ConversionStatus.success,
            exchangeRates: const [
              ExchangeRate(
                cryptocurrency: Bitcoin(),
                currency: CurrencyType.brazilianReal,
                rate: 123712937,
              ),
            ],
          ),
        ],
        verify: (_) => verify(() => usecase.execute(any())).called(1),
      );
    });

    blocTest<ConverterCubit, ConverterState>(
      'emits [loading, failure] for failed call',
      setUp: () {
        when(() => usecase.execute(any())).thenThrow(Exception('error'));
      },
      build: () => ConverterCubit(usecase: usecase),
      act: (cubit) => cubit.fetchExchangeRates('USD'),
      seed: () => ConverterState(status: ConversionStatus.initial),
      expect: () => [
        ConverterState(status: ConversionStatus.loading),
        ConverterState(status: ConversionStatus.failure),
      ],
      verify: (_) => verify(() => usecase.execute(any())).called(1),
    );
  });
}
