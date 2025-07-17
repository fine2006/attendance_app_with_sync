import 'package:drift/drift.dart';

class Thresholds extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get redThreshold => real().withDefault(const Constant(75.0))();
  RealColumn get yellowThreshold => real().withDefault(const Constant(85.0))();

  @override
  Set<Column> get primaryKey => {id};
}
