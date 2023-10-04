import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'create_place_event.dart';

part 'create_place_state.dart';

class CreatePlaceBloc extends Bloc<CreatePlaceEvent, CreatePlaceState> {
  CreatePlaceBloc() : super(const CreatePlaceState()) {
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
  ) async {}

  Future<List<String>> _getImageFromGallery() async {
    final images = await ImagePicker().pickMultiImage();
    final paths = images.map((e) => e.path).toList();

    return paths;
  }
}
