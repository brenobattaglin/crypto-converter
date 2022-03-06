// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'converter_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConverterState _$ConverterStateFromJson(Map<String, dynamic> json) =>
    ConverterState(
      status: $enumDecodeNullable(_$ConversionStatusEnumMap, json['status']) ??
          ConversionStatus.initial,
    );

Map<String, dynamic> _$ConverterStateToJson(ConverterState instance) =>
    <String, dynamic>{
      'status': _$ConversionStatusEnumMap[instance.status],
    };

const _$ConversionStatusEnumMap = {
  ConversionStatus.initial: 'initial',
  ConversionStatus.loading: 'loading',
  ConversionStatus.success: 'success',
  ConversionStatus.failure: 'failure',
};
