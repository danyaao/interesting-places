import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color green;

  final Color yellow;

  final Color red;

  final Color white;

  final Color darkest;

  final Color darker;

  final Color darkGrey;

  final Color grey;

  final Color lightGrey;


  AppColorScheme.light()
      : green = LightColorPalette.green,
        yellow = LightColorPalette.yellow,
        red = LightColorPalette.red,
        white = LightColorPalette.white,
        darkest = LightColorPalette.darkest,
        darker = LightColorPalette.darker,
        darkGrey = LightColorPalette.darkGrey,
        grey = LightColorPalette.grey,
        lightGrey = LightColorPalette.lightGrey;

  const AppColorScheme._({
    required this.green,
    required this.yellow,
    required this.red,
    required this.white,
    required this.darkest,
    required this.darker,
    required this.darkGrey,
    required this.grey,
    required this.lightGrey,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? green,
    Color? yellow,
    Color? red,
    Color? white,
    Color? darkest,
    Color? darker,
    Color? darkGrey,
    Color? grey,
    Color? lightGrey,
  }) {
    return AppColorScheme._(
      green: green ?? this.green,
      yellow: yellow ?? this.yellow,
      red: red ?? this.red,
      white: white ?? this.white,
      darkest: darkest ?? this.darkest,
      darker: darker ?? this.darker,
      darkGrey: darkGrey ?? this.darkGrey,
      grey: grey ?? this.grey,
      lightGrey: lightGrey ?? this.lightGrey,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(ThemeExtension<AppColorScheme>? other,
      double t,) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      green: Color.lerp(green, other.green, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      red: Color.lerp(red, other.red, t)!,
      white: Color.lerp(white, other.white, t)!,
      darkest: Color.lerp(darkest, other.darkest, t)!,
      darker: Color.lerp(darker, other.darker, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
    );
  }
}
