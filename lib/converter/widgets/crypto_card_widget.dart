import 'package:cryptocurrency_converter/app.dart';
import 'package:flutter/material.dart';

class CryptoCardWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final String rate;
  final String abbr;

  const CryptoCardWidget({
    Key? key,
    required this.abbr,
    required this.rate,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Nord0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(children: [
              WidgetSpan(
                  child: Icon(
                icon,
                size: 17,
                color: Nord4,
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
