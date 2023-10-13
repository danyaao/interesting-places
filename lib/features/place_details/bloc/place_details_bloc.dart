import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interesting_places/domain_models/place.dart';

part 'place_details_event.dart';

part 'place_details_state.dart';

class PlaceDetailsBloc extends Bloc<PlaceDetailsEvent, PlaceDetailsState> {
  PlaceDetailsBloc({
    required Place place,
  }) : super(
          PlaceDetailsState(
            place: place,
          ),
        ) {
    on<PlaceDetailsEvent>((event, emit) {});
  }
}
