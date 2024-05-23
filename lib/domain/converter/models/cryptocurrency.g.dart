// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cryptocurrency _$CryptocurrencyFromJson(Map<String, dynamic> json) =>
    Cryptocurrency(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CryptocurrencyToJson(Cryptocurrency instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };
