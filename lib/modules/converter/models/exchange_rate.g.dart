// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) => ExchangeRate(
      cryptocurrency: Cryptocurrency.fromJson(
          json['cryptocurrency'] as Map<String, dynamic>),
      currency: $enumDecode(_$CurrencyTypeEnumMap, json['currency']),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$ExchangeRateToJson(ExchangeRate instance) =>
    <String, dynamic>{
      'cryptocurrency': instance.cryptocurrency,
      'currency': _$CurrencyTypeEnumMap[instance.currency]!,
      'rate': instance.rate,
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
