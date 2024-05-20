import 'package:crypto_converter/app.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final IconData iconData;
  final String rate;
  final String code;

  const CardWidget({
    Key? key,
    required this.code,
    required this.rate,
    required this.name,
    required this.iconData,
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
                  iconData,
                  size: 17,
                  color: Nord4,
                ),
              ),
              TextSpan(text: ' $name')
            ]),
          ),
          Text(
            rate.toString(),
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
          ),
          Text(code, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
