import 'package:crypto_converter/domain/converter/models/exchange_rate.dart';

class InputListExchangeRateDto {
  List<String> cryptoCodes;
  String currencyCode;

  InputListExchangeRateDto({
    required this.cryptoCodes,
    required this.currencyCode,
  });
}

class OutputListExchangeRateDto {
  List<ExchangeRate> exchangeRates;

  OutputListExchangeRateDto({required this.exchangeRates});
}
