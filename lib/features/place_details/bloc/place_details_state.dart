part of 'place_details_bloc.dart';

class PlaceDetailsState extends Equatable {
  const PlaceDetailsState({
    required this.place,
  });

  final Place place;

  @override
  List<Object?> get props => [
        place,
      ];
}
