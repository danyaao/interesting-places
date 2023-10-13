import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:interesting_places/domain_models/domain_models.dart';

class Place extends Equatable {
  const Place({
    required this.name,
    required this.category,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.images,
  });

  final String name;
  final PlaceCategory category;
  final String description;
  final double latitude;
  final double longitude;
  final List<Uint8List> images;

  @override
  List<Object?> get props => [
        name,
        category,
        description,
        latitude,
        longitude,
        images,
      ];
}
