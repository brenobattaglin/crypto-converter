import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:cryptocurrency_converter/app.dart';
import 'package:cryptocurrency_converter/presentation/widgets/crypto_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter', style: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildCryptoCurrencyList(context),
              const DropdownButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _buildCryptoCurrencyList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: const [
            CryptocurrencyCardWidget(
              abbr: 'BTC',
              rate: 9.70,
              name: 'Bitcoin',
              icon: CryptoFontIcons.BTC,
              backgroundColor: Color(0xFFC08F53),
            ),
            CryptocurrencyCardWidget(
              abbr: 'ETH',
              rate: 9.70,
              name: 'Ethereum',
              icon: CryptoFontIcons.ETH,
              backgroundColor: Color(0xFF737376),
            ),
            CryptocurrencyCardWidget(
              abbr: 'LTC',
              rate: 9.70,
              name: 'Litecoin',
              icon: CryptoFontIcons.LTC,
              backgroundColor: Color(0xFF828587),
            ),
            CryptocurrencyCardWidget(
                abbr: 'DOGE',
                rate: 9.70,
                name: 'Dogecoin',
                icon: CryptoFontIcons.DOGE,
                backgroundColor: Color(0xFF9E9057)),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = 'BRL';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
      child: Column(
        children: [
          Text(
            'Select the currency:',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              items: <String>['BRL', 'USD', 'EUR'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
