part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends CryptoState {}

class CryptoLoadSuccess extends CryptoState {}

class CryptoLoadFailed extends CryptoState {}
