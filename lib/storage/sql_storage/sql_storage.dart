import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:interesting_places/storage/storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'sql_storage.g.dart';

@DriftDatabase(tables: [PlaceCMs, ImageCMs])
class SqlStorage extends _$SqlStorage {
  SqlStorage() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
