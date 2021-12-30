import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitial()) {
    on<CryptoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
