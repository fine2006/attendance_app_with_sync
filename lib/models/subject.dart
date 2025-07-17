import 'package:drift/drift.dart';

class Subject extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 2, max: 32)();
  IntColumn get presentDays => integer()();
  IntColumn get absentDays => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
