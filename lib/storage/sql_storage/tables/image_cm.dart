import 'package:drift/drift.dart';

class ImageCMs extends Table {
  IntColumn get placeId => integer()();

  BlobColumn get image => blob()();
}
