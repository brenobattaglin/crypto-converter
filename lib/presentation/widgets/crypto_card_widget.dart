import 'package:flutter/material.dart';

class CryptoCardWidget extends StatelessWidget {
  const CryptoCardWidget({required this.cryptoCurrency, required this.currency, required this.value});

  final String cryptoCurrency;
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
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 25.0,
          ),
          child: Text(
            '1 $cryptoCurrency = $value $currency',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
