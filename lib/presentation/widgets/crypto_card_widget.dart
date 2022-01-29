import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:flutter/material.dart';

class CryptocurrencyCardWidget extends StatelessWidget {
  final Color backgroundColor;
  final String name;
  final IconData icon;
  final double rate;
  final String abbr;

  const CryptocurrencyCardWidget(
      {Key? key,
      required this.abbr,
      required this.rate,
      required this.name,
      required this.icon,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(children: [
              WidgetSpan(
                  child: Icon(
                icon,
                size: 17,
              )),
              TextSpan(text: ' $name')
            ]),
          ),
          Text(rate.toString(), style: Theme.of(context).textTheme.headline3),
          Text(abbr, style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }
}
