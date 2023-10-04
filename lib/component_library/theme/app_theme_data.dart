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
          primary: _lightColorScheme.primary,
          onPrimary: _lightColorScheme.onPrimary,
          secondary: _lightColorScheme.secondary,
          onSecondary: _lightColorScheme.onSecondary,
          error: _lightColorScheme.danger,
          onError: _lightColorScheme.onDanger,
          background: _lightColorScheme.background,
          onBackground: _lightColorScheme.onBackground,
          surface: _lightColorScheme.surface,
          onSurface: _lightColorScheme.onSurface,
          outline: _lightColorScheme.secondary,
          scrim: _lightColorScheme.secondary,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _lightColorScheme.primary,
          contentTextStyle: TextStyle(
            color: _lightColorScheme.onPrimary,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: _lightColorScheme.primary,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: _lightColorScheme.onPrimary,
          ),
        ),
        scaffoldBackgroundColor: _lightColorScheme.background,
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
