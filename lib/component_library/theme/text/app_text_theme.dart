import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle largeTitle;

  final TextStyle title;

  final TextStyle subtitle;

  final TextStyle text;

  final TextStyle smallBold;

  final TextStyle small;

  final TextStyle superSmall;

  final TextStyle button;

  AppTextTheme._({
    required this.largeTitle,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.smallBold,
    required this.small,
    required this.superSmall,
    required this.button,
  });

  AppTextTheme.base()
      : largeTitle = AppTextStyle.largeTitle.value,
        title = AppTextStyle.title.value,
        subtitle = AppTextStyle.subtitle.value,
        text = AppTextStyle.text.value,
        smallBold = AppTextStyle.smallBold.value,
        small = AppTextStyle.small.value,
        superSmall = AppTextStyle.superSmall.value,
        button = AppTextStyle.button.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      largeTitle: TextStyle.lerp(largeTitle, other.largeTitle, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      text: TextStyle.lerp(text, other.text, t)!,
      smallBold: TextStyle.lerp(smallBold, other.smallBold, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      superSmall: TextStyle.lerp(superSmall, other.superSmall, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
    );
  }

  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? largeTitle,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? text,
    TextStyle? smallBold,
    TextStyle? small,
    TextStyle? superSmall,
    TextStyle? button,
  }) {
    return AppTextTheme._(
      largeTitle: largeTitle ?? this.largeTitle,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      text: text ?? this.text,
      smallBold: smallBold ?? this.smallBold,
      small: small ?? this.small,
      superSmall: superSmall ?? this.superSmall,
      button: button ?? this.button,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('No $AppTextTheme found in $context');
