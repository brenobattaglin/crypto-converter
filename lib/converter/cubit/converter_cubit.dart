import 'package:coin_repository/coin_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'converter_state.dart';
part 'converter_cubit.g.dart';

class ConverterCubit extends HydratedCubit<ConverterState> {
  ConverterCubit(this._coinRepository) : super(const ConverterState());

  final CoinRepository _coinRepository;

  @override
  ConverterState? fromJson(Map<String, dynamic> json) => ConverterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ConverterState state) => state.toJson();

  Future<bool> fetchExchangeRate() async {
    emit(state.copyWith(status: ConversionStatus.loading));

    try {
      final response = ExchangeRate.fromRepository(await _coinRepository.getExchangeRate('BTH', 'BRL'));

      emit(state.copyWith(
        status: ConversionStatus.success,
      ));
    } on Exception {
      emit(state.copyWith(status: ConversionStatus.failure));
    }

    // TODO: Create request using the repository
    return true;
  }
}
