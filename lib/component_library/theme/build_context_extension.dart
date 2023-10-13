import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';
import 'package:interesting_places/l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  AppTextTheme get text => Theme.of(this).extension<AppTextTheme>()!;

  AppThemeData get theme => AppTheme.of(this);

  AppColorScheme get colors => Theme.of(this).extension<AppColorScheme>()!;
}
