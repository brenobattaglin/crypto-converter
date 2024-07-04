import 'package:crypto_converter/domain/converter/models/currency.dart';
import 'package:crypto_converter/presenter/converter/cubits/converter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_converter/presenter/converter/views/conversion_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../mocks/classes.dart';
import '../../../mocks/setup.dart';

void main() {
  group('conversion view', () {
    late ConverterCubit converterCubit;

    setUp(() {
      initAppMocks();
      converterCubit = MockConverterCubit();
      when(() => converterCubit.state).thenReturn(ConverterState());
      when(() => converterCubit.fetchExchangeRates(any())).thenAnswer((_) async {});
    });

    Widget buildWidgetForTesting() => BlocProvider.value(
          value: converterCubit,
          child: const MaterialApp(
            home: ConversionView(),
          ),
        );

    testWidgets('should build properly', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidgetForTesting());
      await tester.pump(const Duration(seconds: 2));

      expect(find.byKey(const Key('conversion_view_app_bar')), findsOneWidget);
      expect(find.byKey(const Key('conversion_view_content')), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SmartRefresher), findsOneWidget);
      expect(find.byType(DropdownButtonHideUnderline), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('should refresh on pull down', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidgetForTesting());
      await tester.pump(const Duration(seconds: 2));

      final smartRefresher = find.byType(SmartRefresher);
      final refreshController = tester.widget<SmartRefresher>(smartRefresher).controller;

      expect(refreshController.isRefresh, true);

      await tester.drag(smartRefresher, const Offset(0, 200));
      await tester.pump(const Duration(seconds: 2));

      expect(refreshController.isRefresh, isTrue);
    });

    testWidgets('should change selected currency on dropdown button change', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidgetForTesting());
      await tester.pump(const Duration(seconds: 2));

      final dropdownButtonFinder = find.byKey(const Key('currency_view_dropdown_button'));
      final refreshController = tester.widget<SmartRefresher>(find.byType(SmartRefresher)).controller;
      final initialCurrency = SupportedCurrencies.list.entries.first.value;
      final selectedCurrency = SupportedCurrencies.list.entries.last.value;

      expect(refreshController.isRefresh, true);

      await tester.tap(dropdownButtonFinder);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.text(selectedCurrency.code));
      await tester.pump(const Duration(seconds: 5));

      expect(refreshController.isRefresh, isTrue);

      await tester.tap(dropdownButtonFinder);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.text(initialCurrency.code));
      await tester.pump(const Duration(seconds: 2));

      expect(refreshController.isRefresh, isTrue);
    });
  });
}
