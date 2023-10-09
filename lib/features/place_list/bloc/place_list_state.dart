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
  });

  final List<PlaceDM> places;

  @override
  List<Object?> get props => [
        places,
      ];
}
