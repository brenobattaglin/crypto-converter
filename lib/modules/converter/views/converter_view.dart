import 'package:crypto_converter/core/strings.dart';
import 'package:crypto_converter/modules/converter/cubits/converter_cubit.dart';
import 'package:crypto_converter/modules/converter/models/currency.dart';
import 'package:crypto_converter/modules/converter/widgets/converter_cryptocurrencies_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversionView extends StatefulWidget {
  const ConversionView({super.key});

  @override
  State<ConversionView> createState() => _ConversionViewState();
}

class _ConversionViewState extends State<ConversionView> {
  late Currency selectedCurrency;

  @override
  void initState() {
    selectedCurrency = SupportedCurrencies.list.entries.first.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildContent(),
      );

  Widget _buildContent() => BlocConsumer<ConverterCubit, ConverterState>(
        listener: (_, state) {
          if (state.status == ConversionStatus.failure) {
            _showSnackBar(AppStrings.somethingWentWrong);
          } else if (state.status == ConversionStatus.success) {
            _showSnackBar(AppStrings.cryptocurrenciesUpdated);
          }
        },
        builder: (_, __) {
          return _buildPullToRefresh(
            scrollView: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildFiatMoneyDropdownButton(),
                        _buildCryptocurrencyGrid(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );

  void _showSnackBar(String text) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text)),
      );

  AppBar _buildAppBar() => AppBar(
        key: const Key('conversion_view_app_bar'),
        title: const Text(AppStrings.appName, style: TextStyle(fontSize: 15)),
      );

  Widget _buildPullToRefresh({required CustomScrollView scrollView}) => RefreshIndicator(
        onRefresh: fetchExchangeRates,
        child: scrollView,
      );

  Future<void> fetchExchangeRates() async =>
      BlocProvider.of<ConverterCubit>(context).fetchExchangeRates(selectedCurrency.code);

  Widget _buildCryptocurrencyGrid() => ConverterCryptocurrencies();

  Widget _buildFiatMoneyDropdownButton() => Column(
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
                    key: const Key('converter_view_dropdown_button'),
                    value: selectedCurrency,
                    icon: const Icon(Icons.arrow_downward),
                    items: _buildDropdownItems(),
                    onChanged: (Currency? newValue) {
                      selectedCurrency = newValue ?? selectedCurrency;
                      fetchExchangeRates();
                    }),
              ),
            ],
          ),
        ],
      );

  List<DropdownMenuItem<Currency>> _buildDropdownItems() => SupportedCurrencies.list.entries
      .map((entry) => DropdownMenuItem<Currency>(
            key: Key('converter_view_dropdown_item_${entry.key}'),
            value: entry.value,
            child: Text(
              entry.key,
            ),
          ))
      .toList();
}
