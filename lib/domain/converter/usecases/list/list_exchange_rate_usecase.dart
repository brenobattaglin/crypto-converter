import 'dart:developer';

import 'package:crypto_converter/domain/converter/models/exchange_rate.dart';
import 'package:crypto_converter/domain/converter/usecases/list/list_exchange_rate_dto.dart';
import 'package:crypto_converter/core/usecase.dart';
import 'package:crypto_converter/infrastructure/coin_api/repository/coin_repository.dart';

class ListExchangeRateUsecase implements Usecase<InputListExchangeRateDto, OutputListExchangeRateDto> {
  final CoinRepository _coinRepository;

  ListExchangeRateUsecase({CoinRepository? coinRepository}) : _coinRepository = coinRepository ?? CoinRepository();

  @override
  Future<OutputListExchangeRateDto> execute(InputListExchangeRateDto input) async {
    try {
      List<ExchangeRate> output = [];
      //TODO: needs performance improvement
      for (final cryptoCode in input.cryptoCodes) {
        final response = ExchangeRate.fromRepository(
          await _coinRepository.getExchangeRate(cryptoCode, input.currencyCode),
        );
        output.add(response);
      }

      return OutputListExchangeRateDto(exchangeRates: output);
    } catch (e) {
      //TODO: check better error structure
      log('[ListExchangeRateUsecase] Error: $e');
      throw Exception();
    }
  }
}
