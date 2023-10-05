import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interesting_places/features/create_place/ui/select_categoty_screen.dart';

part 'create_place_event.dart';

part 'create_place_state.dart';

class CreatePlaceBloc extends Bloc<CreatePlaceEvent, CreatePlaceState> {
  CreatePlaceBloc() : super(CreatePlaceState()) {
    _registerEventHandler();
  }

  void _registerEventHandler() {
    on<CreatePlaceEvent>(
      (event, emitter) async {
        if (event is PickImagesFromGalleryEvent) {
          await _handlePickImagesFromGalleryEvent(emitter);
        } else if (event is DeleteImageFromSelectionEvent) {
          await _handleDeleteImageFromSelectionEvent(emitter, event);
        } else if (event is NameChangedEvent) {
          await _handleNameChangedEvent(emitter, event);
        } else if (event is LatitudeChangedEvent) {
          await _handleLatitudeChangedEvent(emitter, event);
        } else if (event is LongitudeChangedEvent) {
          await _handleLongitudeChangedEvent(emitter, event);
        } else if (event is SelectCategoryEvent) {
          await _handleSelectCategoryEvent(emitter, event);
        }
      },
    );
  }

  Future<void> _handlePickImagesFromGalleryEvent(
    Emitter emitter,
  ) async {
    final newImages = await _getImageFromGallery();
    newImages.addAll(state.images ?? []);

    emitter(state.copyWith(
      images: newImages,
    ));
  }

  Future<void> _handleDeleteImageFromSelectionEvent(
    Emitter emitter,
    DeleteImageFromSelectionEvent event,
  ) async {
    final newImages = state.images!.toList();
    newImages.removeAt(event.index);

    emitter(state.copyWith(
      images: newImages,
    ));
  }

  Future<void> _handleNameChangedEvent(
    Emitter emitter,
    NameChangedEvent event,
  ) async {
    if (event.name.length < 3) {
      emitter(state.copyWith(
        isNameValid: false,
      ));
    } else {
      emitter(state.copyWith(
        name: event.name,
        isNameValid: true,
      ));
    }
  }

  Future<void> _handleLatitudeChangedEvent(
    Emitter emitter,
    LatitudeChangedEvent event,
  ) async {
    if (double.tryParse(event.latitude) == null) {
      emitter(state.copyWith(
        isLatitudeValid: false,
      ));
    } else {
      emitter(state.copyWith(
        latitude: event.latitude,
        isLatitudeValid: true,
      ));
    }
  }

  Future<void> _handleLongitudeChangedEvent(
    Emitter emitter,
    LongitudeChangedEvent event,
  ) async {
    if (double.tryParse(event.longitude) == null) {
      emitter(state.copyWith(
        isLongitudeValid: false,
      ));
    } else {
      emitter(state.copyWith(
        latitude: event.longitude,
        isLongitudeValid: true,
      ));
    }
  }

  Future<void> _handleSelectCategoryEvent(
    Emitter emitter,
    SelectCategoryEvent event,
  ) async {
    final context = event.context;
    final selectedCategory = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectCategoryScreen()),
    );

    emitter(state.copyWith(
      category: selectedCategory,
    ));
  }

  Future<List<String>> _getImageFromGallery() async {
    final images = await ImagePicker().pickMultiImage();
    final paths = images.map((e) => e.path).toList();

    return paths;
  }
}
