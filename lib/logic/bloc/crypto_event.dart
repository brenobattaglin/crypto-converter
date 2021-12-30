part of 'crypto_bloc.dart';

abstract class CryptoEvent extends Equatable {
  const CryptoEvent();

  @override
  List<Object> get props => [];
}

class CryptoLoadInProgress extends CryptoEvent {}

class CryptoLoadSuccess extends CryptoEvent {}

class CryptoLoadFailed extends CryptoEvent {}
