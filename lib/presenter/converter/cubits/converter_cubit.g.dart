// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConverterState _$ConverterStateFromJson(Map<String, dynamic> json) =>
    ConverterState(
      status: $enumDecodeNullable(_$ConversionStatusEnumMap, json['status']) ??
          ConversionStatus.initial,
      exchangeRates: json['exchangeRates'],
    );

Map<String, dynamic> _$ConverterStateToJson(ConverterState instance) =>
    <String, dynamic>{
      'status': _$ConversionStatusEnumMap[instance.status]!,
      'exchangeRates': instance.exchangeRates,
    };

const _$ConversionStatusEnumMap = {
  ConversionStatus.initial: 'initial',
  ConversionStatus.loading: 'loading',
  ConversionStatus.success: 'success',
  ConversionStatus.failure: 'failure',
};
