// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) => ExchangeRate(
      time: json['time'] as String,
      assetIdBase: $enumDecode(_$CurrencyIdBaseEnumMap, json['asset_id_base']),
      assetIdQuote:
          $enumDecode(_$CurrencyIdQuoteEnumMap, json['asset_id_quote']),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$ExchangeRateToJson(ExchangeRate instance) =>
    <String, dynamic>{
      'time': instance.time,
      'asset_id_base': _$CurrencyIdBaseEnumMap[instance.assetIdBase]!,
      'asset_id_quote': _$CurrencyIdQuoteEnumMap[instance.assetIdQuote]!,
      'rate': instance.rate,
    };

const _$CurrencyIdBaseEnumMap = {
  CurrencyIdBase.bitcoin: 'BTC',
  CurrencyIdBase.ethereum: 'ETH',
  CurrencyIdBase.litecoin: 'LTC',
  CurrencyIdBase.dogecoin: 'DOGE',
};

const _$CurrencyIdQuoteEnumMap = {
  CurrencyIdQuote.australianDollar: 'AUD',
  CurrencyIdQuote.brazilianReal: 'BRL',
  CurrencyIdQuote.canadianDollar: 'CAD',
  CurrencyIdQuote.chineseYuan: 'CNY',
  CurrencyIdQuote.euro: 'EUR',
  CurrencyIdQuote.greatBritishPound: 'GBP',
  CurrencyIdQuote.hongKongDollar: 'HKD',
  CurrencyIdQuote.indonesianRupiah: 'IDR',
  CurrencyIdQuote.israeliShekel: 'ILS',
  CurrencyIdQuote.indianRupee: 'INR',
  CurrencyIdQuote.japaneseYen: 'JPY',
  CurrencyIdQuote.mexicanPeso: 'MXN',
  CurrencyIdQuote.norwegianKroner: 'NOK',
  CurrencyIdQuote.newZealandDollar: 'NZD',
  CurrencyIdQuote.polishZloty: 'PLN',
  CurrencyIdQuote.romaniaNewLei: 'RON',
  CurrencyIdQuote.russianRuble: 'RUB',
  CurrencyIdQuote.swedishKrona: 'SEK',
  CurrencyIdQuote.singaporeDollar: 'SGD',
  CurrencyIdQuote.usDollar: 'USD',
  CurrencyIdQuote.southAfricanRand: 'ZAR',
};
