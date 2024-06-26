import 'package:json_annotation/json_annotation.dart';

part 'exchange_rate.g.dart';

enum CurrencyIdBase {
  @JsonValue('BTC')
  bitcoin,
  @JsonValue('ETH')
  ethereum,
  @JsonValue('LTC')
  litecoin,
  @JsonValue('DOGE')
  dogecoin,
}

extension CurrencyIdBaseX on CurrencyIdBase {
  String? get abbr => _$CurrencyIdBaseEnumMap[this];
}

enum CurrencyIdQuote {
  @JsonValue('AUD')
  australianDollar,
  @JsonValue('BRL')
  brazilianReal,
  @JsonValue('CAD')
  canadianDollar,
  @JsonValue('CNY')
  chineseYuan,
  @JsonValue('EUR')
  euro,
  @JsonValue('GBP')
  greatBritishPound,
  @JsonValue('HKD')
  hongKongDollar,
  @JsonValue('IDR')
  indonesianRupiah,
  @JsonValue('ILS')
  israeliShekel,
  @JsonValue('INR')
  indianRupee,
  @JsonValue('JPY')
  japaneseYen,
  @JsonValue('MXN')
  mexicanPeso,
  @JsonValue('NOK')
  norwegianKroner,
  @JsonValue('NZD')
  newZealandDollar,
  @JsonValue('PLN')
  polishZloty,
  @JsonValue('RON')
  romaniaNewLei,
  @JsonValue('RUB')
  russianRuble,
  @JsonValue('SEK')
  swedishKrona,
  @JsonValue('SGD')
  singaporeDollar,
  @JsonValue('USD')
  usDollar,
  @JsonValue('ZAR')
  southAfricanRand
}

extension CurrencyIdQuoteX on CurrencyIdQuote {
  String? get abbr => _$CurrencyIdQuoteEnumMap[this];
}

@JsonSerializable()
class ExchangeRate {
  @JsonKey(name: 'time')
  final String time;
  @JsonKey(name: 'asset_id_base')
  final CurrencyIdBase assetIdBase;
  @JsonKey(name: 'asset_id_quote')
  final CurrencyIdQuote assetIdQuote;
  @JsonKey(name: 'rate')
  final double rate;

  ExchangeRate({
    required this.time,
    required this.assetIdBase,
    required this.assetIdQuote,
    required this.rate,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json) => _$ExchangeRateFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeRateToJson(this);
}
