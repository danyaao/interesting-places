import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get newPlaceAppBar => 'Новое место';

  @override
  String get cancelAppBar => 'Отмена';

  @override
  String get categoryButton => 'КАТЕГОРИЯ';

  @override
  String get unselectedButton => 'Не выбрано';

  @override
  String get placeNameTextField => 'НАЗВАНИЕ';

  @override
  String get latitudeTextField => 'ШИРОТА';

  @override
  String get longitudeTextField => 'ДОЛГОТА';

  @override
  String get pointOnTheMapButton => 'Указать на карте';

  @override
  String get descriptionTextField => 'ОПИСАНИЕ';

  @override
  String get createButton => 'СОЗДАТЬ';

  @override
  String get saveButton => 'СОХРАНИТЬ';

  @override
  String get categoryAppBar => 'Категория';

  @override
  String get categories => 'Кинотеатр;Ресторан;Особое место;Театр;Музей;Кафе';
}
