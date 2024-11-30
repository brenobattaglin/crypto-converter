import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_converter/core/strings.dart';
import 'package:crypto_converter/modules/converter/cubits/converter_cubit.dart';
import 'package:crypto_converter/modules/converter/models/currency.dart';
import 'package:crypto_converter/modules/converter/views/converter_view.dart';
import 'package:crypto_converter/modules/converter/widgets/converter_cryptocurrencies_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/classes.dart';
import '../../mocks/setup.dart';

void main() {
  late ConverterCubit converterCubit;

  setUp(() {
    initAppMocks();
    converterCubit = MockConverterCubit();
    when(() => converterCubit.state).thenReturn(ConverterState());
    when(() => converterCubit.state).thenReturn(ConverterState(status: ConversionStatus.success));
  });

  Widget buildWidgetForTesting() => MaterialApp(
        home: BlocProvider<ConverterCubit>.value(
          value: converterCubit,
          child: const ConversionView(),
        ),
      );

  group('when view is rendered', () {
    testWidgets('should display app bar with correct title', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidgetForTesting());

      expect(find.byKey(const Key('conversion_view_app_bar')), findsOneWidget);
      expect(find.text(AppStrings.appName), findsOneWidget);
    });

    testWidgets('should display fiat money dropdown button', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidgetForTesting());
      expect(find.byKey(const Key('currency_view_dropdown_button')), findsOneWidget);
    });

    testWidgets('should display cryptocurrency grid', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidgetForTesting());
      expect(find.byType(ConverterCryptocurrencies), findsOneWidget);
    });

    testWidgets('should show snackbar on conversion failure', (WidgetTester tester) async {
      when(() => converterCubit.state).thenReturn(ConverterState(status: ConversionStatus.failure));
      whenListen(
        converterCubit,
        Stream.fromIterable([ConverterState(status: ConversionStatus.failure)]),
      );
      await tester.pumpWidget(buildWidgetForTesting());
      expect(find.text(AppStrings.somethingWentWrong), findsNothing);

      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 600));
      await tester.pump();
      await tester.pumpAndSettle(Durations.medium1);

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(AppStrings.somethingWentWrong), findsOneWidget);
    });

    testWidgets('should show snackbar on conversion success', (WidgetTester tester) async {
      when(() => converterCubit.state).thenReturn(ConverterState(status: ConversionStatus.success));
      whenListen(
        converterCubit,
        Stream.fromIterable([ConverterState(status: ConversionStatus.success)]),
      );
      await tester.pumpWidget(buildWidgetForTesting());
      expect(find.text(AppStrings.cryptocurrenciesUpdated), findsNothing);

      await tester.drag(find.byType(RefreshIndicator), const Offset(0, 600));
      await tester.pump();
      await tester.pumpAndSettle(Durations.medium1);

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(AppStrings.cryptocurrenciesUpdated), findsOneWidget);
    });

    testWidgets('should display correct initial selected currency in dropdown', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidgetForTesting());

      final initialCurrency = SupportedCurrencies.list.entries.first.value;
      expect(find.text(initialCurrency.code), findsOneWidget);
    });

    testWidgets('should update selected currency and fetch exchange rates on dropdown change',
        (WidgetTester tester) async {
      final currency = SupportedCurrencies.list.entries.first.value;

      await tester.pumpWidget(buildWidgetForTesting());

      await tester.tap(find.byKey(const Key('currency_view_dropdown_button')));
      await tester.pumpAndSettle();

      await tester.tap(find.text(currency.code).last);
      await tester.pumpAndSettle();

      verify(() => converterCubit.fetchExchangeRates(currency.code)).called(1);
    });
  });
}
