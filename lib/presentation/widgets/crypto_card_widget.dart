import 'package:flutter/material.dart';

//TODO: refactor this file

class CryptoCardWidget extends StatelessWidget {
  const CryptoCardWidget({required this.cryptoCurrency, required this.currency, required this.value});

  final CryptoCurrency cryptoCurrency;
  final String currency;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 25.0,
          ),
          child: Row(
            children: [
              Icon(cryptoCurrency.icon),
              Text(
                '1 ${cryptoCurrency.name} = $value $currency',
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
