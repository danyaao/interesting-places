import 'package:drift/drift.dart';

class PlaceCMs extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get category => text()();

  TextColumn get description => text()();

  RealColumn get latitude => real()();

  RealColumn get longitude => real()();
}
