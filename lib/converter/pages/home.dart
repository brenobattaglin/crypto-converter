import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:cryptocurrency_converter/converter/converter.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

RefreshController _refreshController = RefreshController(initialRefresh: false);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter', style: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          header: const WaterDropHeader(),
          controller: _refreshController,
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
      ),
    );
  }

  _buildCryptoCurrencyList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          children: const [
            CryptoCardWidget(
              abbr: 'BTC',
              rate: 9.70,
              name: 'Bitcoin',
              icon: CryptoFontIcons.BTC,
            ),
            CryptoCardWidget(
              abbr: 'ETH',
              rate: 9.70,
              name: 'Ethereum',
              icon: CryptoFontIcons.ETH,
            ),
            CryptoCardWidget(
              abbr: 'LTC',
              rate: 9.70,
              name: 'Litecoin',
              icon: CryptoFontIcons.LTC,
            ),
            CryptoCardWidget(
              abbr: 'DOGE',
              rate: 9.70,
              name: 'Dogecoin',
              icon: CryptoFontIcons.DOGE,
            ),
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
