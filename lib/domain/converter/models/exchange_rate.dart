import 'package:crypto_converter/infrastructure/coin_api/models/exchange_rate_data.dart';
import 'package:crypto_converter/domain/converter/models/cryptocurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate.g.dart';

@JsonSerializable()
class ExchangeRate extends Equatable {
  final Cryptocurrency cryptocurrency;
  final CurrencyType currency;
  final double rate;

  const ExchangeRate({
    required this.cryptocurrency,
    required this.currency,
    required this.rate,
  });

  factory ExchangeRate.fromRepository(ExchangeRateData exchangeRate) {
    return ExchangeRate(
      cryptocurrency: Cryptocurrency.fromRepository(exchangeRate.cryptoCurrency),
      currency: exchangeRate.currency,
      rate: exchangeRate.rate,
    );
  }

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateToJson(this);

  static ExchangeRate empty = ExchangeRate(
    cryptocurrency: Cryptocurrency.empty,
    currency: CurrencyType.empty,
    rate: 0.0,
  );

  @override
  List<Object> get props => [cryptocurrency, currency, rate];
}
