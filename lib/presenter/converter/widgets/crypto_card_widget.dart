import 'package:crypto_converter/app.dart';
import 'package:crypto_converter/domain/converter/models/cryptocurrency.dart';
import 'package:crypto_converter/core/presenter/icons.dart';
import 'package:flutter/material.dart';

class CryptoCardWidget extends StatelessWidget {
  final Cryptocurrency crypto;
  final String rate;

  const CryptoCardWidget({
    Key? key,
    required this.crypto,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(children: [
              WidgetSpan(
                child: Icon(
                  AppIcons.getIconData(_cryptoName),
                  size: 17,
                  color: Nord4,
                ),
              ),
              TextSpan(text: ' ${crypto.name}')
            ]),
          ),
          Text(
            rate.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
          ),
          Text(_cryptoCode, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }

  String get _cryptoName => crypto.name;

  String get _cryptoCode => crypto.code;
}
