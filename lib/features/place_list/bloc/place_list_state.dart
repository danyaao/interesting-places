part of 'place_list_bloc.dart';

sealed class PlaceListState extends Equatable {
  const PlaceListState();
}

class PlaceListInitialState extends PlaceListState {
  @override
  List<Object> get props => [];
}

class PlaceListFailureState extends PlaceListState {
  @override
  List<Object> get props => [];
}

class PlaceListSuccessState extends PlaceListState {
  const PlaceListSuccessState({
    required this.places,
    this.placeFilters = const PlaceFilters.initial(),
    this.selectedFilterIndexes = const [],
  });

  final List<Place> places;
  final PlaceFilters placeFilters;
  final List<int> selectedFilterIndexes;

  PlaceListSuccessState copyWith({
    List<Place>? places,
    PlaceFilters? placeFilters,
    List<int>? selectedFilterIndexes,
  }) {
    return PlaceListSuccessState(
      places: places ?? this.places,
      placeFilters: placeFilters ?? this.placeFilters,
      selectedFilterIndexes:
          selectedFilterIndexes ?? this.selectedFilterIndexes,
    );
  }

  @override
  List<Object?> get props => [
        places,
        placeFilters,
        selectedFilterIndexes,
      ];
}
