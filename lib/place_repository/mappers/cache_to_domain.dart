import 'dart:typed_data';

import 'package:interesting_places/domain_models/place_dm.dart';
import 'package:interesting_places/storage/sql_storage/sql_storage.dart';

extension PlaceCacheToDomain on PlaceCM {
  PlaceDM toDomainModel({
    required List<Uint8List> images,
  }) {
    return PlaceDM(
      name: name,
      category: category,
      description: description,
      latitude: latitude,
      longitude: longitude,
      images: images,
    );
  }
}
