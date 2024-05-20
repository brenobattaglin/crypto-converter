import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:coin_repository/coin_repository.dart' as coin_repository;
import 'package:crypto_converter/domain/converter/converter.dart';

@JsonSerializable()
class ExchangeRate extends Equatable {
  final Cryptocurrency cryptocurrency;
  final coin_repository.Currency currency;
  final double rate;

  const ExchangeRate({
    required this.cryptocurrency,
    required this.currency,
    required this.rate,
  });

  factory ExchangeRate.fromRepository(coin_repository.ExchangeRate exchangeRate) {
    return ExchangeRate(
      cryptocurrency: Cryptocurrency.fromRepository(exchangeRate.cryptoCurrency),
      currency: exchangeRate.currency,
      rate: exchangeRate.rate,
    );
  }

  static ExchangeRate empty = ExchangeRate(
    cryptocurrency: Cryptocurrency.empty,
    currency: coin_repository.Currency.empty,
    rate: 0.0,
  );

  @override
  List<Object> get props => [cryptocurrency, currency, rate];
}
