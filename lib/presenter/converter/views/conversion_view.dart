import 'package:crypto_converter/app.dart';
import 'package:crypto_converter/domain/converter/models/currency.dart';
import 'package:crypto_converter/domain/converter/models/exchange_rate.dart';
import 'package:crypto_converter/core/presenter/core.dart';
import 'package:crypto_converter/presenter/converter/cubits/converter_cubit.dart';
import 'package:crypto_converter/presenter/converter/widgets/crypto_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ConversionView extends StatefulWidget {
  const ConversionView({Key? key}) : super(key: key);

  @override
  State<ConversionView> createState() => _ConversionViewState();
}

class _ConversionViewState extends State<ConversionView> {
  late Currency selectedCurrency;
  late RefreshController refreshController;

  @override
  void initState() {
    selectedCurrency = SupportedCurrencies.list.entries.first.value;
    refreshController = RefreshController(initialRefresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName, style: TextStyle(fontSize: 15)),
      ),
      body: SafeArea(
        child: BlocListener<ConverterCubit, ConverterState>(
          listener: (context, state) {
            if (state.status == ConversionStatus.failure) {
              refreshController.refreshFailed();
            } else if (state.status == ConversionStatus.success) {
              refreshController.refreshCompleted();
            }
          },
          child: SmartRefresher(
            primary: false,
            enablePullDown: true,
            onRefresh: _onRefresh,
            header: const WaterDropHeader(),
            controller: refreshController,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildCoinDropdownButton(refreshController: refreshController),
                    BlocBuilder<ConverterCubit, ConverterState>(
                      builder: (context, state) => _buildCryptoCurrencyList(state.exchangeRates),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onRefresh() async => context.read<ConverterCubit>().fetchExchangeRates(selectedCurrency.code);

  _buildCryptoCurrencyList(List<ExchangeRate> exchangeRates) => Expanded(
        child: GridView.count(
          primary: false,
          crossAxisCount: 2,
          children: [
            for (var exchange in exchangeRates)
              CryptoCardWidget(
                crypto: exchange.cryptocurrency,
                rate: exchange.rate.toStringAsFixed(2),
              )
          ],
        ),
      );

  Widget _buildCoinDropdownButton({required RefreshController refreshController}) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppStrings.currencyLabel,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor: nord0,
                  value: selectedCurrency,
                  icon: const Icon(Icons.arrow_downward),
                  items: SupportedCurrencies.list.entries
                      .map((entry) => DropdownMenuItem<Currency>(
                            value: entry.value,
                            child: Text(
                              entry.key,
                            ),
                          ))
                      .toList(),
                  onChanged: (Currency? newValue) => setState(() {
                    selectedCurrency = newValue!;
                    refreshController.requestRefresh(needMove: true);
                  }),
                ),
              ),
            ],
          ),
        ],
      );
}
