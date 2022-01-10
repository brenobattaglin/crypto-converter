import 'package:json_annotation/json_annotation.dart';
import 'package:coin_repository/coin_repository.dart' as coin_repository;

part 'exchange_rate.g.dart';

@JsonSerializable()
class ExchangeRate {
  const ExchangeRate({
    this.cryptocurrency,
    this.currency,
    this.rate,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

  factory ExchangeRate.fromRepository(coin_repository.ExchangeRate exchangeRate) {
    return ExchangeRate(
      cryptocurrency: exchangeRate.cryptoCurrency,
      currency: exchangeRate.currency,
      rate: exchangeRate.rate,
    );
  }
}
