import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'converter_state.dart';
part 'converter_cubit.g.dart';

class ConverterCubit extends HydratedCubit<ConverterState> {
  ConverterCubit() : super(ConverterInitial());

  @override
  ConverterState? fromJson(Map<String, dynamic> json) => ConverterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ConverterState state) => state.toJson();

  Future<void> fetchExchangeRate() async {}
}
