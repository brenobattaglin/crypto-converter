// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'exchange_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ExchangeRate',
      json,
      ($checkedConvert) {
        final val = ExchangeRate(
          time: $checkedConvert('time', (v) => v as String),
          assetIdBase: $checkedConvert(
              'asset_id_base', (v) => $enumDecode(_$CryptocurrencyEnumMap, v)),
          assetIdQuote: $checkedConvert(
              'asset_id_quote', (v) => $enumDecode(_$CurrencyEnumMap, v)),
          rate: $checkedConvert('rate', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'assetIdBase': 'asset_id_base',
        'assetIdQuote': 'asset_id_quote'
      },
    );

const _$CryptocurrencyEnumMap = {
  Cryptocurrency.bitcoin: 'BTC',
  Cryptocurrency.ethereum: 'ETH',
  Cryptocurrency.litecoin: 'LTC',
};

const _$CurrencyEnumMap = {
  Currency.australianDollar: 'AUD',
  Currency.brazilianReal: 'BRL',
  Currency.canadianDollar: 'CAD',
  Currency.chineseYuan: 'CNY',
  Currency.euro: 'EUR',
  Currency.greatBritishPound: 'GBP',
  Currency.hongKongDollar: 'HKD',
  Currency.indonesianRupiah: 'IDR',
  Currency.israeliShekel: 'ILS',
  Currency.indianRupee: 'INR',
  Currency.japaneseYen: 'JPY',
  Currency.mexicanPeso: 'MXN',
  Currency.norwegianKroner: 'NOK',
  Currency.newZealandDollar: 'NZD',
  Currency.polishZloty: 'PLN',
  Currency.romaniaNewLei: 'RON',
  Currency.russianRuble: 'RUB',
  Currency.swedishKrona: 'SEK',
  Currency.singaporeDollar: 'SGD',
  Currency.usDollar: 'USD',
  Currency.southAfricanRand: 'ZAR',
};
