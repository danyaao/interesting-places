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
    required this.context,
  });

  final BuildContext context;

  @override
  List<Object?> get props => [
        context,
      ];
}
