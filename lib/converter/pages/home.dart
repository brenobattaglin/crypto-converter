import 'package:coin_repository/coin_repository.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:cryptocurrency_converter/app.dart';
import 'package:cryptocurrency_converter/converter/converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../converter.dart';

RefreshController _refreshController = RefreshController(initialRefresh: true);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConverterCubit(
        context.read<CoinRepository>(),
      ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter', style: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: SmartRefresher(
          onRefresh: () async {
            final response = await context.read<ConverterCubit>().fetchExchangeRate();

            if (context.read<ConverterCubit>().state.status == ConversionStatus.failure) {
              _refreshController.refreshFailed();
            } else {
              _refreshController.refreshCompleted();
            }
          },
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
              rate: '--',
              name: 'Bitcoin',
              icon: CryptoFontIcons.BTC,
            ),
            CryptoCardWidget(
              abbr: 'ETH',
              rate: '--',
              name: 'Ethereum',
              icon: CryptoFontIcons.ETH,
            ),
            CryptoCardWidget(
              abbr: 'LTC',
              rate: '--',
              name: 'Litecoin',
              icon: CryptoFontIcons.LTC,
            ),
            CryptoCardWidget(
              abbr: 'DOGE',
              rate: '--',
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
              dropdownColor: Nord0,
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
