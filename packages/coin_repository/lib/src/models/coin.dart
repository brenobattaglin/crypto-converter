import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

enum Cryptocurrency {
  empty,
  bitcoin,
  ethereum,
  litecoin,
  dogecoin,
}

enum Currency {
  empty,
  australianDollar,
  brazilianReal,
  canadianDollar,
  chineseYuan,
  euro,
  greatBritishPound,
  hongKongDollar,
  indonesianRupiah,
  israeliShekel,
  indianRupee,
  japaneseYen,
  mexicanPeso,
  norwegianKroner,
  newZealandDollar,
  polishZloty,
  romaniaNewLei,
  russianRuble,
  swedishKrona,
  singaporeDollar,
  usDollar,
  southAfricanRand
}

@JsonSerializable()
class ExchangeRate extends Equatable {
  const ExchangeRate({
    required this.cryptoCurrency,
    required this.currency,
    required this.rate,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateToJson(this);

  final Cryptocurrency cryptoCurrency;
  final Currency currency;
  final double rate;

  @override
  List<Object?> get props => [cryptoCurrency, currency, rate];
}
