enum PlaceCategory {
  hotel('hotel', 'assets/icons/hotel.svg'),
  restaurant('restaurant', 'assets/icons/restaurant.svg'),
  specialPlace('specialPlace', 'assets/icons/special_place.svg'),
  park('park', 'assets/icons/park.svg'),
  museum('museum', 'assets/icons/museum.svg'),
  cafe('cafe', 'assets/icons/cafe.svg');

  const PlaceCategory(
    this.name,
    this.iconPath,
  );

  final String name;
  final String iconPath;

  @override
  String toString() => name;
}
