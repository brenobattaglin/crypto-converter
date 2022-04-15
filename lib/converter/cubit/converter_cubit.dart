import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:cryptocurrency_converter/converter/converter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:coin_repository/coin_repository.dart' show CoinRepository;

part 'converter_state.dart';
part 'converter_cubit.g.dart';

class ConverterCubit extends HydratedCubit<ConverterState> {
  ConverterCubit(this._coinRepository) : super(ConverterState());

  final CoinRepository _coinRepository;

  @override
  ConverterState? fromJson(Map<String, dynamic> json) => ConverterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ConverterState state) => state.toJson();

  Future<void> fetchExchangeRate() async {
    emit(state.copyWith(status: ConversionStatus.loading));

    try {
      //TODO: Check if one request can be made to the API
      final btcResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('BTC', 'BRL'),
      );
      final ethResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('ETH', 'BRL'),
      );
      final lthResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('LTC', 'BRL'),
      );
      final dogeResponse = ExchangeRate.fromRepository(
        await _coinRepository.getExchangeRate('BTC', 'BRL'),
      );

      emit(state.copyWith(
        status: ConversionStatus.success,
        exchangeRates: List<ExchangeRate>.unmodifiable([
          btcResponse,
          ethResponse,
          lthResponse,
          dogeResponse,
        ]),
      ));
    } on Exception catch (e) {
      emit(state.copyWith(status: ConversionStatus.failure));
    }
  }
}
