import 'package:crypto_converter/core/strings.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDisabledItem(
              title: AppStrings.favoriteCurrencies,
              description: AppStrings.favoriteCurrenciesDescription,
            ),
            _buildDisabledItem(
              title: AppStrings.favoriteCryptos,
              description: AppStrings.favoriteCryptosDescription,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisabledItem({required String title, required String description}) => ListTile(
        title: Text(title),
        subtitle: Text(description),
        enabled: false,
      );
}
