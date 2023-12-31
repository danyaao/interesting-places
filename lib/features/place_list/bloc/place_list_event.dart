part of 'place_list_bloc.dart';

abstract class PlaceListEvent extends Equatable {
  const PlaceListEvent();
}

class PlaceListRefreshEvent extends PlaceListEvent {
  const PlaceListRefreshEvent();

  @override
  List<Object?> get props => [];
}

class PlaceListCreatePlaceEvent extends PlaceListEvent {
  const PlaceListCreatePlaceEvent({
    required this.placeDM,
  });

  final PlaceDM placeDM;

  @override
  List<Object?> get props => [
        placeDM,
      ];
}

class PlaceListFilterEvent extends PlaceListEvent {
  const PlaceListFilterEvent({
    required this.placeFilters,
    required this.selectedIndexes,
  });

  final PlaceFilters placeFilters;
  final List<int> selectedIndexes;

  @override
  List<Object?> get props => [
        placeFilters,
        selectedIndexes,
      ];
}
