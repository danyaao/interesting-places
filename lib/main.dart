import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/features/create_place/ui/create_place_screen.dart';
import 'package:interesting_places/l10n/app_localizations.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      const App(),
    );
  }, (error, stack) {});
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _lightTheme = LightAppThemeData();
  final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      lightTheme: _lightTheme,
      darkTheme: _darkTheme,
      child: MaterialApp(
        theme: _lightTheme.themeData,
        darkTheme: _darkTheme.themeData,
        themeMode: ThemeMode.light,
        supportedLocales: const [
          Locale('ru'),
        ],
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        home: const CreatePlaceScreen(),
      ),
    );
  }
}
