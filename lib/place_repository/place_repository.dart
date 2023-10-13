import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/place_repository/mappers/cache_to_domain.dart';
import 'package:interesting_places/storage/storage.dart';

class PlaceRepository {
  PlaceRepository({
    required SqlStorage sqlStorage,
  }) : _sqlStorage = sqlStorage;

  final SqlStorage _sqlStorage;

  Future<void> insertPlace(Place placeDM) async {
    final placeId = await _sqlStorage.into(_sqlStorage.placeCMs).insert(
          PlaceCMsCompanion.insert(
            name: placeDM.name,
            category: placeDM.category.toString(),
            description: placeDM.description,
            latitude: placeDM.latitude,
            longitude: placeDM.longitude,
          ),
        );

    for (final image in placeDM.images) {
      await _sqlStorage.into(_sqlStorage.imageCMs).insert(
            ImageCMsCompanion.insert(
              placeId: placeId,
              image: image,
            ),
          );
    }
  }

  Future<List<Place>> getPlacesFromStorage({
    List<String>? categories,
  }) async {
    final List<Place> placesDM = [];

    final placesCMSelect = categories != null && categories.isNotEmpty
        ? (_sqlStorage.select(_sqlStorage.placeCMs)
          ..where((tbl) => tbl.category.isIn(categories)))
        : (_sqlStorage.select(_sqlStorage.placeCMs));

    final placesCM = await placesCMSelect.get();

    for (final placeCM in placesCM) {
      final placeId = placeCM.id;

      final imagesCMSelect = _sqlStorage.select(_sqlStorage.imageCMs)
        ..where((tbl) => tbl.placeId.equals(placeId));

      final imagesCM = await imagesCMSelect.get();

      final images = imagesCM.map((e) => e.image).toList();

      placesDM.add(placeCM.toDomainModel(images: images));
    }

    return placesDM;
  }
}
