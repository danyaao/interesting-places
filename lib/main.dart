import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/features/place_list/ui/place_list_screen.dart';
import 'package:interesting_places/l10n/app_localizations.dart';
import 'package:interesting_places/place_repository/place_repository.dart';
import 'package:interesting_places/storage/sql_storage/sql_storage.dart';

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
  final _sqlStorage = SqlStorage();
  late final _placeRepository = PlaceRepository(sqlStorage: _sqlStorage);

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
        home: PlaceListScreen(
          placeRepository: _placeRepository,
        ),
      ),
    );
  }
}
