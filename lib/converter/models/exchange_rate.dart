import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:coin_repository/coin_repository.dart' as coin_repository;

@JsonSerializable()
class ExchangeRate extends Equatable {
  final coin_repository.Cryptocurrency cryptocurrency;
  final coin_repository.Currency currency;
  final double rate;

  const ExchangeRate({
    required this.cryptocurrency,
    required this.currency,
    required this.rate,
  });

  factory ExchangeRate.fromRepository(coin_repository.ExchangeRate exchangeRate) {
    return ExchangeRate(
      cryptocurrency: exchangeRate.cryptoCurrency,
      currency: exchangeRate.currency,
      rate: exchangeRate.rate,
    );
  }

  static const empty = ExchangeRate(
    cryptocurrency: coin_repository.Cryptocurrency.empty,
    currency: coin_repository.Currency.empty,
    rate: 0.0,
  );

  @override
  List<Object> get props => [cryptocurrency, currency, rate];
}
