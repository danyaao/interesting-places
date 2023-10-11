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
    this.placeFilters = const PlaceFilters.clear(),
  });

  final List<PlaceDM> places;
  final PlaceFilters placeFilters;

  PlaceListSuccessState copyWith({
    List<PlaceDM>? places,
    PlaceFilters? placeFilters,
  }) {
    return PlaceListSuccessState(
      places: places ?? this.places,
      placeFilters: placeFilters ?? this.placeFilters,
    );
  }

  @override
  List<Object?> get props => [
        places,
        placeFilters,
      ];
}
