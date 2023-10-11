import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

abstract base class AppThemeData {
  ThemeData get themeData;

  double get screenMargin => 16;
}

final class LightAppThemeData extends AppThemeData {
  static final _lightColorScheme = AppColorScheme.light();
  static final _textTheme = AppTextTheme.base();

  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: _lightColorScheme.green,
          onPrimary: _lightColorScheme.white,
          secondary: _lightColorScheme.green,
          onSecondary: _lightColorScheme.white,
          error: _lightColorScheme.red,
          onError: _lightColorScheme.white,
          background: _lightColorScheme.white,
          onBackground: _lightColorScheme.darkest,
          surface: _lightColorScheme.white,
          onSurface: _lightColorScheme.darkest,
        ),
        appBarTheme: AppBarTheme(
          color: _lightColorScheme.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: _lightColorScheme.darkest,
          ),
          titleTextStyle: _textTheme.subtitle.copyWith(
            color: _lightColorScheme.darkest,
          ),
        ),
        scaffoldBackgroundColor: _lightColorScheme.white,
        extensions: [
          _lightColorScheme,
          _textTheme,
        ],
      );
}

final class DarkAppThemeData extends AppThemeData {
  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.dark,
      );
}
