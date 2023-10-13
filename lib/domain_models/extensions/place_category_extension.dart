import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/l10n/app_localizations.dart';

extension PlaceCategoryExtension on PlaceCategory {
  String getPlaceCategoryName(AppLocalizations l10n) {
    switch (this) {
      case PlaceCategory.hotel:
        return l10n.hotelCategory;
      case PlaceCategory.restaurant:
        return l10n.restaurantCategory;
      case PlaceCategory.specialPlace:
        return l10n.specialPlaceCategory;
      case PlaceCategory.park:
        return l10n.parkCategory;
      case PlaceCategory.museum:
        return l10n.museumCategory;
      case PlaceCategory.cafe:
        return l10n.cafeCategory;
    }
  }
}
