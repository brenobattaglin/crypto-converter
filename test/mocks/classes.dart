import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_converter/modules/converter/usecases/list_exchange_rate/list_exchange_rate_usecase.dart';
import 'package:crypto_converter/modules/converter/cubits/converter_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

class MockConverterCubit extends MockCubit<ConverterState> implements ConverterCubit {}

class MockListExchangeRateUsecase extends Mock implements ListExchangeRateUsecase {}
