import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru')
  ];

  /// No description provided for @newPlaceAppBar.
  ///
  /// In ru, this message translates to:
  /// **'Новое место'**
  String get newPlaceAppBar;

  /// No description provided for @cancelAppBar.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancelAppBar;

  /// No description provided for @categoryButton.
  ///
  /// In ru, this message translates to:
  /// **'КАТЕГОРИЯ'**
  String get categoryButton;

  /// No description provided for @unselectedButton.
  ///
  /// In ru, this message translates to:
  /// **'Не выбрано'**
  String get unselectedButton;

  /// No description provided for @placeNameTextField.
  ///
  /// In ru, this message translates to:
  /// **'НАЗВАНИЕ'**
  String get placeNameTextField;

  /// No description provided for @latitudeTextField.
  ///
  /// In ru, this message translates to:
  /// **'ШИРОТА'**
  String get latitudeTextField;

  /// No description provided for @longitudeTextField.
  ///
  /// In ru, this message translates to:
  /// **'ДОЛГОТА'**
  String get longitudeTextField;

  /// No description provided for @pointOnTheMapButton.
  ///
  /// In ru, this message translates to:
  /// **'Указать на карте'**
  String get pointOnTheMapButton;

  /// No description provided for @descriptionTextField.
  ///
  /// In ru, this message translates to:
  /// **'ОПИСАНИЕ'**
  String get descriptionTextField;

  /// No description provided for @createButton.
  ///
  /// In ru, this message translates to:
  /// **'СОЗДАТЬ'**
  String get createButton;

  /// No description provided for @saveButton.
  ///
  /// In ru, this message translates to:
  /// **'СОХРАНИТЬ'**
  String get saveButton;

  /// No description provided for @categoryAppBar.
  ///
  /// In ru, this message translates to:
  /// **'Категория'**
  String get categoryAppBar;

  /// No description provided for @categories.
  ///
  /// In ru, this message translates to:
  /// **'Кинотеатр;Ресторан;Особое место;Театр;Музей;Кафе'**
  String get categories;

  /// No description provided for @placeListAppBar.
  ///
  /// In ru, this message translates to:
  /// **'Список интересных мест'**
  String get placeListAppBar;

  /// No description provided for @searchBarTextFieldHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get searchBarTextFieldHint;

  /// No description provided for @newPlaceButton.
  ///
  /// In ru, this message translates to:
  /// **'НОВОЕ МЕСТО'**
  String get newPlaceButton;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
