import 'package:crypto_converter/core/icons.dart';
import 'package:crypto_converter/core/routes.dart';
import 'package:crypto_converter/core/strings.dart';
import 'package:crypto_converter/core/theme.dart';
import 'package:crypto_converter/modules/converter/cubits/converter_cubit.dart';
import 'package:crypto_converter/modules/converter/views/converter_view.dart';
import 'package:crypto_converter/modules/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    _lockScreenOrientation();
    _setStatusBarIconsColorToDark();
    return BlocProvider(
      create: (context) => ConverterCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppTheme().theme,
          initialRoute: Routes.initial,
          onGenerateRoute: RouteManager.getRoute,
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              body: _buildTabBarView(),
              bottomNavigationBar: _buildTabs(),
            ),
          )),
    );
  }

  Widget _buildTabs() => const BottomAppBar(
        color: Color.fromARGB(0, 8, 6, 6),
        child: TabBar(
          tabs: [
            Tab(key: Key('app_tab_conversion'), icon: Icon(AppIcons.bitcoin)),
            Tab(key: Key('app_tab_settings'), icon: Icon(AppIcons.settings)),
          ],
        ),
      );

  Widget _buildTabBarView() => const TabBarView(children: [
        ConversionView(),
        SettingsView(),
      ]);

  void _lockScreenOrientation() => SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

  void _setStatusBarIconsColorToDark() => SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ));
}
