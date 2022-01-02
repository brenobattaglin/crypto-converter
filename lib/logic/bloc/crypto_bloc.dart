import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitial()) {
    on<CryptoLoadStarted>(_onCryptoLoadStarted);
  }

  void _onCryptoLoadStarted(CryptoLoadStarted event, Emitter<CryptoState> emit) {
    emit(CryptoLoadSuccess());
  }
}
