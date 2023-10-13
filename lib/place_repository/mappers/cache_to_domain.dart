import 'dart:typed_data';

import 'package:interesting_places/domain_models/domain_models.dart';
import 'package:interesting_places/storage/storage.dart';

extension PlaceCacheToDomain on PlaceCM {
  Place toDomainModel({
    required List<Uint8List> images,
  }) {
    return Place(
      name: name,
      category: PlaceCategory.values.firstWhere(
        (e) => e.toString() == category,
      ),
      description: description,
      latitude: latitude,
      longitude: longitude,
      images: images,
    );
  }
}
