// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRateData _$ExchangeRateDataFromJson(Map<String, dynamic> json) =>
    ExchangeRateData(
      cryptoCurrency:
          $enumDecode(_$CryptocurrencyTypeEnumMap, json['cryptoCurrency']),
      currency: $enumDecode(_$CurrencyTypeEnumMap, json['currency']),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$ExchangeRateDataToJson(ExchangeRateData instance) =>
    <String, dynamic>{
      'cryptoCurrency': _$CryptocurrencyTypeEnumMap[instance.cryptoCurrency]!,
      'currency': _$CurrencyTypeEnumMap[instance.currency]!,
      'rate': instance.rate,
    };

const _$CryptocurrencyTypeEnumMap = {
  CryptocurrencyType.empty: 'empty',
  CryptocurrencyType.bitcoin: 'bitcoin',
  CryptocurrencyType.ethereum: 'ethereum',
  CryptocurrencyType.litecoin: 'litecoin',
  CryptocurrencyType.dogecoin: 'dogecoin',
};

const _$CurrencyTypeEnumMap = {
  CurrencyType.empty: 'empty',
  CurrencyType.australianDollar: 'australianDollar',
  CurrencyType.brazilianReal: 'brazilianReal',
  CurrencyType.canadianDollar: 'canadianDollar',
  CurrencyType.chineseYuan: 'chineseYuan',
  CurrencyType.euro: 'euro',
  CurrencyType.greatBritishPound: 'greatBritishPound',
  CurrencyType.hongKongDollar: 'hongKongDollar',
  CurrencyType.indonesianRupiah: 'indonesianRupiah',
  CurrencyType.israeliShekel: 'israeliShekel',
  CurrencyType.indianRupee: 'indianRupee',
  CurrencyType.japaneseYen: 'japaneseYen',
  CurrencyType.mexicanPeso: 'mexicanPeso',
  CurrencyType.norwegianKroner: 'norwegianKroner',
  CurrencyType.newZealandDollar: 'newZealandDollar',
  CurrencyType.polishZloty: 'polishZloty',
  CurrencyType.romaniaNewLei: 'romaniaNewLei',
  CurrencyType.russianRuble: 'russianRuble',
  CurrencyType.swedishKrona: 'swedishKrona',
  CurrencyType.singaporeDollar: 'singaporeDollar',
  CurrencyType.usDollar: 'usDollar',
  CurrencyType.southAfricanRand: 'southAfricanRand',
};
