import 'package:crypto_converter/modules/converter/models/exchange_rate.dart';
import 'package:equatable/equatable.dart';

class InputListExchangeRateDto extends Equatable {
  final List<String> cryptoCodes;
  final String currencyCode;

  const InputListExchangeRateDto({
    required this.cryptoCodes,
    required this.currencyCode,
  });

  @override
  List<Object?> get props => [cryptoCodes, currencyCode];
}

class OutputListExchangeRateDto extends Equatable {
  final List<ExchangeRate> exchangeRates;

  const OutputListExchangeRateDto({required this.exchangeRates});

  @override
  List<Object?> get props => [exchangeRates];
}
