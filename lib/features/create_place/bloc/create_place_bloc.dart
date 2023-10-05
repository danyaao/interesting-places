import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_place_event.dart';

part 'create_place_state.dart';

class CreatePlaceBloc extends Bloc<CreatePlaceEvent, CreatePlaceState> {
  CreatePlaceBloc() : super(CreatePlaceInitial()) {
    on<CreatePlaceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
