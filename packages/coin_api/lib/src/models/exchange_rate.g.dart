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
              'asset_id_base', (v) => $enumDecode(_$CurrencyIdBaseEnumMap, v)),
          assetIdQuote: $checkedConvert('asset_id_quote',
              (v) => $enumDecode(_$CurrencyIdQuoteEnumMap, v)),
          rate: $checkedConvert('rate', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'assetIdBase': 'asset_id_base',
        'assetIdQuote': 'asset_id_quote'
      },
    );

const _$CurrencyIdBaseEnumMap = {
  CurrencyIdBase.bitcoin: 'BTC',
  CurrencyIdBase.ethereum: 'ETH',
  CurrencyIdBase.litecoin: 'LTC',
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
