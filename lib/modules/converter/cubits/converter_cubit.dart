import 'dart:core';
import 'dart:developer';

import 'package:crypto_converter/modules/converter/models/exchange_rate.dart';
import 'package:crypto_converter/modules/converter/usecases/list_exchange_rate/list_exchange_rate_dto.dart';
import 'package:crypto_converter/modules/converter/usecases/list_exchange_rate/list_exchange_rate_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'converter_cubit.g.dart';
part 'converter_state.dart';

class ConverterCubit extends HydratedCubit<ConverterState> {
  final ListExchangeRateUsecase _usecase;

  ConverterCubit({ListExchangeRateUsecase? usecase})
      : _usecase = usecase ?? ListExchangeRateUsecase(),
        super(ConverterState());

  @override
  ConverterState? fromJson(Map<String, dynamic> json) => ConverterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ConverterState state) => state.toJson();

  Future<void> fetchExchangeRates(String currencyCode) async {
    emit(state.copyWith(status: ConversionStatus.loading));

    try {
      final response = await _usecase.execute(
        InputListExchangeRateDto(
          currencyCode: currencyCode,
          cryptoCodes: const [
            'BTC',
            'ETH',
            'LTC',
            'DOGE',
          ],
        ),
      );
      emit(state.copyWith(
        status: ConversionStatus.success,
        exchangeRates: response.exchangeRates,
      ));
    } catch (e) {
      log('[ConverterCubit] Error: $e');
      emit(state.copyWith(status: ConversionStatus.failure));
    }
  }
}
