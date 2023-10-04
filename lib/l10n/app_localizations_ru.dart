import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get newPlace => 'Новое место';

  @override
  String get cancel => 'Отмена';

  @override
  String get category => 'КАТЕГОРИЯ';

  @override
  String get unselected => 'Не выбрано';

  @override
  String get placeName => 'НАЗВАНИЕ';

  @override
  String get latitude => 'ШИРОТА';

  @override
  String get longitude => 'ДОЛГОТА';

  @override
  String get pointOnTheMap => 'Указать на карте';

  @override
  String get description => 'ОПИСАНИЕ';

  @override
  String get descriptionHint => 'Текст';

  @override
  String get create => 'Создать';

  @override
  String get save => 'Сохранить';
}
