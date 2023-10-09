import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class PlaceDM extends Equatable {
  const PlaceDM({
    required this.name,
    required this.category,
    this.description,
    required this.latitude,
    required this.longitude,
    required this.images,
  });

  final String name;
  final String category;
  final String? description;
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
