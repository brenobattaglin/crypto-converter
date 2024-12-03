import 'dart:developer';

import 'package:crypto_converter/core/usecase.dart';
import 'package:crypto_converter/modules/coin_api/repository/coin_repository.dart';
import 'package:crypto_converter/modules/converter/models/exchange_rate.dart';
import 'package:crypto_converter/modules/converter/usecases/list_exchange_rate/list_exchange_rate_dto.dart';

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
    } on Object catch (e, stackTrace) {
      //TODO: check better error structure
      log('[ListExchangeRateUsecase] Error: $e, stackTrace: $stackTrace', error: e);
      throw Exception();
    }
  }
}
