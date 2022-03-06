import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'converter_state.dart';

class ConverterCubit extends Cubit<ConverterState> {
  ConverterCubit() : super(ConverterInitial());
}
