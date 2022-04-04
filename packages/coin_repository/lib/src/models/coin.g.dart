// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ExchangeRate',
      json,
      ($checkedConvert) {
        final val = ExchangeRate(
          cryptoCurrency: $checkedConvert('crypto_currency', (v) => $enumDecode(_$CryptocurrencyEnumMap, v)),
          currency: $checkedConvert('currency', (v) => $enumDecode(_$CurrencyEnumMap, v)),
          rate: $checkedConvert('rate', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'cryptoCurrency': 'crypto_currency'},
    );

Map<String, dynamic> _$ExchangeRateToJson(ExchangeRate instance) => <String, dynamic>{
      'crypto_currency': _$CryptocurrencyEnumMap[instance.cryptoCurrency],
      'currency': _$CurrencyEnumMap[instance.currency],
      'rate': instance.rate,
    };

const _$CryptocurrencyEnumMap = {
  Cryptocurrency.bitcoin: 'Bitcoin',
  Cryptocurrency.ethereum: 'Ethereum',
  Cryptocurrency.litecoin: 'Litecoin',
};

const _$CurrencyEnumMap = {
  Currency.australianDollar: 'australianDollar',
  Currency.brazilianReal: 'brazilianReal',
  Currency.canadianDollar: 'canadianDollar',
  Currency.chineseYuan: 'chineseYuan',
  Currency.euro: 'euro',
  Currency.greatBritishPound: 'greatBritishPound',
  Currency.hongKongDollar: 'hongKongDollar',
  Currency.indonesianRupiah: 'indonesianRupiah',
  Currency.israeliShekel: 'israeliShekel',
  Currency.indianRupee: 'indianRupee',
  Currency.japaneseYen: 'japaneseYen',
  Currency.mexicanPeso: 'mexicanPeso',
  Currency.norwegianKroner: 'norwegianKroner',
  Currency.newZealandDollar: 'newZealandDollar',
  Currency.polishZloty: 'polishZloty',
  Currency.romaniaNewLei: 'romaniaNewLei',
  Currency.russianRuble: 'russianRuble',
  Currency.swedishKrona: 'swedishKrona',
  Currency.singaporeDollar: 'singaporeDollar',
  Currency.usDollar: 'usDollar',
  Currency.southAfricanRand: 'southAfricanRand',
};
