import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate_data.g.dart';

enum CryptocurrencyType {
  empty,
  bitcoin,
  ethereum,
  litecoin,
  dogecoin,
}

enum CurrencyType {
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
class ExchangeRateData extends Equatable {
  const ExchangeRateData({
    required this.cryptoCurrency,
    required this.currency,
    required this.rate,
  });

  factory ExchangeRateData.fromJson(Map<String, dynamic> json) => _$ExchangeRateDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateDataToJson(this);

  final CryptocurrencyType cryptoCurrency;
  final CurrencyType currency;
  final double rate;

  @override
  List<Object?> get props => [cryptoCurrency, currency, rate];
}
