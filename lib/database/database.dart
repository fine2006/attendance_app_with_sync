import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:attendance_app_with_sync/models/subject.dart';
import 'package:attendance_app_with_sync/models/thresholds.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Subject, Thresholds])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'attendance_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.dart.js'),
      ),
    );
  }

  Stream<List<SubjectData>> get allSubjects => select(subject).watch();
  Future<int> addSubject(SubjectCompanion entry) => into(subject).insert(entry);
  Stream<List<SubjectData>> searchStream(String c) {
    return (select(subject)..where((t) => t.name.contains(c))).watch();
  }

  Stream<SubjectData> getData(int id) =>
      (select(subject)..where((t) => t.id.equals(id))).watchSingle();
  Stream<Threshold> getThresholds(int id) {
    return (select(thresholds)..where((t) => t.id.equals(id))).watchSingle();
  }

  Future updateSubject(SubjectCompanion updatedSubject) {
    return update(subject).replace(updatedSubject);
  }

  Future insertThreshold(ThresholdsCompanion threshold) {
    return into(thresholds).insert(threshold);
  }

  Future updateThreshold(ThresholdsCompanion threshold) {
    return update(thresholds).replace(threshold);
  }

  Future<bool> thresholdsExist(int id) {
    return (select(thresholds)..where(
      (t) => t.id.equals(id),
    )).getSingleOrNull().then((value) => value != null);
  }

  Future<bool> exists(String c) {
    return (select(subject)..where(
      (t) => t.name.equals(c),
    )).getSingleOrNull().then((value) => value != null);
  }

  Future<int> clearAllSubjects() async {
    return delete(subject).go();
  }
}
