// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SubjectTable extends Subject with TableInfo<$SubjectTable, SubjectData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _presentDaysMeta = const VerificationMeta(
    'presentDays',
  );
  @override
  late final GeneratedColumn<int> presentDays = GeneratedColumn<int>(
    'present_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _absentDaysMeta = const VerificationMeta(
    'absentDays',
  );
  @override
  late final GeneratedColumn<int> absentDays = GeneratedColumn<int>(
    'absent_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, presentDays, absentDays];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubjectData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('present_days')) {
      context.handle(
        _presentDaysMeta,
        presentDays.isAcceptableOrUnknown(
          data['present_days']!,
          _presentDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_presentDaysMeta);
    }
    if (data.containsKey('absent_days')) {
      context.handle(
        _absentDaysMeta,
        absentDays.isAcceptableOrUnknown(data['absent_days']!, _absentDaysMeta),
      );
    } else if (isInserting) {
      context.missing(_absentDaysMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      presentDays:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}present_days'],
          )!,
      absentDays:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}absent_days'],
          )!,
    );
  }

  @override
  $SubjectTable createAlias(String alias) {
    return $SubjectTable(attachedDatabase, alias);
  }
}

class SubjectData extends DataClass implements Insertable<SubjectData> {
  final int id;
  final String name;
  final int presentDays;
  final int absentDays;
  const SubjectData({
    required this.id,
    required this.name,
    required this.presentDays,
    required this.absentDays,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['present_days'] = Variable<int>(presentDays);
    map['absent_days'] = Variable<int>(absentDays);
    return map;
  }

  SubjectCompanion toCompanion(bool nullToAbsent) {
    return SubjectCompanion(
      id: Value(id),
      name: Value(name),
      presentDays: Value(presentDays),
      absentDays: Value(absentDays),
    );
  }

  factory SubjectData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      presentDays: serializer.fromJson<int>(json['presentDays']),
      absentDays: serializer.fromJson<int>(json['absentDays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'presentDays': serializer.toJson<int>(presentDays),
      'absentDays': serializer.toJson<int>(absentDays),
    };
  }

  SubjectData copyWith({
    int? id,
    String? name,
    int? presentDays,
    int? absentDays,
  }) => SubjectData(
    id: id ?? this.id,
    name: name ?? this.name,
    presentDays: presentDays ?? this.presentDays,
    absentDays: absentDays ?? this.absentDays,
  );
  SubjectData copyWithCompanion(SubjectCompanion data) {
    return SubjectData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      presentDays:
          data.presentDays.present ? data.presentDays.value : this.presentDays,
      absentDays:
          data.absentDays.present ? data.absentDays.value : this.absentDays,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('presentDays: $presentDays, ')
          ..write('absentDays: $absentDays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, presentDays, absentDays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectData &&
          other.id == this.id &&
          other.name == this.name &&
          other.presentDays == this.presentDays &&
          other.absentDays == this.absentDays);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> presentDays;
  final Value<int> absentDays;
  const SubjectCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.presentDays = const Value.absent(),
    this.absentDays = const Value.absent(),
  });
  SubjectCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int presentDays,
    required int absentDays,
  }) : name = Value(name),
       presentDays = Value(presentDays),
       absentDays = Value(absentDays);
  static Insertable<SubjectData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? presentDays,
    Expression<int>? absentDays,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (presentDays != null) 'present_days': presentDays,
      if (absentDays != null) 'absent_days': absentDays,
    });
  }

  SubjectCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? presentDays,
    Value<int>? absentDays,
  }) {
    return SubjectCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      presentDays: presentDays ?? this.presentDays,
      absentDays: absentDays ?? this.absentDays,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (presentDays.present) {
      map['present_days'] = Variable<int>(presentDays.value);
    }
    if (absentDays.present) {
      map['absent_days'] = Variable<int>(absentDays.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('presentDays: $presentDays, ')
          ..write('absentDays: $absentDays')
          ..write(')'))
        .toString();
  }
}

class $ThresholdsTable extends Thresholds
    with TableInfo<$ThresholdsTable, Threshold> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThresholdsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _redThresholdMeta = const VerificationMeta(
    'redThreshold',
  );
  @override
  late final GeneratedColumn<double> redThreshold = GeneratedColumn<double>(
    'red_threshold',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(75.0),
  );
  static const VerificationMeta _yellowThresholdMeta = const VerificationMeta(
    'yellowThreshold',
  );
  @override
  late final GeneratedColumn<double> yellowThreshold = GeneratedColumn<double>(
    'yellow_threshold',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(85.0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, redThreshold, yellowThreshold];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'thresholds';
  @override
  VerificationContext validateIntegrity(
    Insertable<Threshold> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('red_threshold')) {
      context.handle(
        _redThresholdMeta,
        redThreshold.isAcceptableOrUnknown(
          data['red_threshold']!,
          _redThresholdMeta,
        ),
      );
    }
    if (data.containsKey('yellow_threshold')) {
      context.handle(
        _yellowThresholdMeta,
        yellowThreshold.isAcceptableOrUnknown(
          data['yellow_threshold']!,
          _yellowThresholdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Threshold map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Threshold(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      redThreshold:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}red_threshold'],
          )!,
      yellowThreshold:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}yellow_threshold'],
          )!,
    );
  }

  @override
  $ThresholdsTable createAlias(String alias) {
    return $ThresholdsTable(attachedDatabase, alias);
  }
}

class Threshold extends DataClass implements Insertable<Threshold> {
  final int id;
  final double redThreshold;
  final double yellowThreshold;
  const Threshold({
    required this.id,
    required this.redThreshold,
    required this.yellowThreshold,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['red_threshold'] = Variable<double>(redThreshold);
    map['yellow_threshold'] = Variable<double>(yellowThreshold);
    return map;
  }

  ThresholdsCompanion toCompanion(bool nullToAbsent) {
    return ThresholdsCompanion(
      id: Value(id),
      redThreshold: Value(redThreshold),
      yellowThreshold: Value(yellowThreshold),
    );
  }

  factory Threshold.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Threshold(
      id: serializer.fromJson<int>(json['id']),
      redThreshold: serializer.fromJson<double>(json['redThreshold']),
      yellowThreshold: serializer.fromJson<double>(json['yellowThreshold']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'redThreshold': serializer.toJson<double>(redThreshold),
      'yellowThreshold': serializer.toJson<double>(yellowThreshold),
    };
  }

  Threshold copyWith({
    int? id,
    double? redThreshold,
    double? yellowThreshold,
  }) => Threshold(
    id: id ?? this.id,
    redThreshold: redThreshold ?? this.redThreshold,
    yellowThreshold: yellowThreshold ?? this.yellowThreshold,
  );
  Threshold copyWithCompanion(ThresholdsCompanion data) {
    return Threshold(
      id: data.id.present ? data.id.value : this.id,
      redThreshold:
          data.redThreshold.present
              ? data.redThreshold.value
              : this.redThreshold,
      yellowThreshold:
          data.yellowThreshold.present
              ? data.yellowThreshold.value
              : this.yellowThreshold,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Threshold(')
          ..write('id: $id, ')
          ..write('redThreshold: $redThreshold, ')
          ..write('yellowThreshold: $yellowThreshold')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, redThreshold, yellowThreshold);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Threshold &&
          other.id == this.id &&
          other.redThreshold == this.redThreshold &&
          other.yellowThreshold == this.yellowThreshold);
}

class ThresholdsCompanion extends UpdateCompanion<Threshold> {
  final Value<int> id;
  final Value<double> redThreshold;
  final Value<double> yellowThreshold;
  const ThresholdsCompanion({
    this.id = const Value.absent(),
    this.redThreshold = const Value.absent(),
    this.yellowThreshold = const Value.absent(),
  });
  ThresholdsCompanion.insert({
    this.id = const Value.absent(),
    this.redThreshold = const Value.absent(),
    this.yellowThreshold = const Value.absent(),
  });
  static Insertable<Threshold> custom({
    Expression<int>? id,
    Expression<double>? redThreshold,
    Expression<double>? yellowThreshold,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (redThreshold != null) 'red_threshold': redThreshold,
      if (yellowThreshold != null) 'yellow_threshold': yellowThreshold,
    });
  }

  ThresholdsCompanion copyWith({
    Value<int>? id,
    Value<double>? redThreshold,
    Value<double>? yellowThreshold,
  }) {
    return ThresholdsCompanion(
      id: id ?? this.id,
      redThreshold: redThreshold ?? this.redThreshold,
      yellowThreshold: yellowThreshold ?? this.yellowThreshold,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (redThreshold.present) {
      map['red_threshold'] = Variable<double>(redThreshold.value);
    }
    if (yellowThreshold.present) {
      map['yellow_threshold'] = Variable<double>(yellowThreshold.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThresholdsCompanion(')
          ..write('id: $id, ')
          ..write('redThreshold: $redThreshold, ')
          ..write('yellowThreshold: $yellowThreshold')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectTable subject = $SubjectTable(this);
  late final $ThresholdsTable thresholds = $ThresholdsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [subject, thresholds];
}

typedef $$SubjectTableCreateCompanionBuilder =
    SubjectCompanion Function({
      Value<int> id,
      required String name,
      required int presentDays,
      required int absentDays,
    });
typedef $$SubjectTableUpdateCompanionBuilder =
    SubjectCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> presentDays,
      Value<int> absentDays,
    });

class $$SubjectTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectTable> {
  $$SubjectTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get presentDays => $composableBuilder(
    column: $table.presentDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get absentDays => $composableBuilder(
    column: $table.absentDays,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SubjectTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectTable> {
  $$SubjectTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get presentDays => $composableBuilder(
    column: $table.presentDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get absentDays => $composableBuilder(
    column: $table.absentDays,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectTable> {
  $$SubjectTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get presentDays => $composableBuilder(
    column: $table.presentDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get absentDays => $composableBuilder(
    column: $table.absentDays,
    builder: (column) => column,
  );
}

class $$SubjectTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectTable,
          SubjectData,
          $$SubjectTableFilterComposer,
          $$SubjectTableOrderingComposer,
          $$SubjectTableAnnotationComposer,
          $$SubjectTableCreateCompanionBuilder,
          $$SubjectTableUpdateCompanionBuilder,
          (
            SubjectData,
            BaseReferences<_$AppDatabase, $SubjectTable, SubjectData>,
          ),
          SubjectData,
          PrefetchHooks Function()
        > {
  $$SubjectTableTableManager(_$AppDatabase db, $SubjectTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SubjectTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SubjectTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SubjectTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> presentDays = const Value.absent(),
                Value<int> absentDays = const Value.absent(),
              }) => SubjectCompanion(
                id: id,
                name: name,
                presentDays: presentDays,
                absentDays: absentDays,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int presentDays,
                required int absentDays,
              }) => SubjectCompanion.insert(
                id: id,
                name: name,
                presentDays: presentDays,
                absentDays: absentDays,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SubjectTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectTable,
      SubjectData,
      $$SubjectTableFilterComposer,
      $$SubjectTableOrderingComposer,
      $$SubjectTableAnnotationComposer,
      $$SubjectTableCreateCompanionBuilder,
      $$SubjectTableUpdateCompanionBuilder,
      (SubjectData, BaseReferences<_$AppDatabase, $SubjectTable, SubjectData>),
      SubjectData,
      PrefetchHooks Function()
    >;
typedef $$ThresholdsTableCreateCompanionBuilder =
    ThresholdsCompanion Function({
      Value<int> id,
      Value<double> redThreshold,
      Value<double> yellowThreshold,
    });
typedef $$ThresholdsTableUpdateCompanionBuilder =
    ThresholdsCompanion Function({
      Value<int> id,
      Value<double> redThreshold,
      Value<double> yellowThreshold,
    });

class $$ThresholdsTableFilterComposer
    extends Composer<_$AppDatabase, $ThresholdsTable> {
  $$ThresholdsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get redThreshold => $composableBuilder(
    column: $table.redThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get yellowThreshold => $composableBuilder(
    column: $table.yellowThreshold,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ThresholdsTableOrderingComposer
    extends Composer<_$AppDatabase, $ThresholdsTable> {
  $$ThresholdsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get redThreshold => $composableBuilder(
    column: $table.redThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get yellowThreshold => $composableBuilder(
    column: $table.yellowThreshold,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ThresholdsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ThresholdsTable> {
  $$ThresholdsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get redThreshold => $composableBuilder(
    column: $table.redThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<double> get yellowThreshold => $composableBuilder(
    column: $table.yellowThreshold,
    builder: (column) => column,
  );
}

class $$ThresholdsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ThresholdsTable,
          Threshold,
          $$ThresholdsTableFilterComposer,
          $$ThresholdsTableOrderingComposer,
          $$ThresholdsTableAnnotationComposer,
          $$ThresholdsTableCreateCompanionBuilder,
          $$ThresholdsTableUpdateCompanionBuilder,
          (
            Threshold,
            BaseReferences<_$AppDatabase, $ThresholdsTable, Threshold>,
          ),
          Threshold,
          PrefetchHooks Function()
        > {
  $$ThresholdsTableTableManager(_$AppDatabase db, $ThresholdsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ThresholdsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ThresholdsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ThresholdsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> redThreshold = const Value.absent(),
                Value<double> yellowThreshold = const Value.absent(),
              }) => ThresholdsCompanion(
                id: id,
                redThreshold: redThreshold,
                yellowThreshold: yellowThreshold,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> redThreshold = const Value.absent(),
                Value<double> yellowThreshold = const Value.absent(),
              }) => ThresholdsCompanion.insert(
                id: id,
                redThreshold: redThreshold,
                yellowThreshold: yellowThreshold,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ThresholdsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ThresholdsTable,
      Threshold,
      $$ThresholdsTableFilterComposer,
      $$ThresholdsTableOrderingComposer,
      $$ThresholdsTableAnnotationComposer,
      $$ThresholdsTableCreateCompanionBuilder,
      $$ThresholdsTableUpdateCompanionBuilder,
      (Threshold, BaseReferences<_$AppDatabase, $ThresholdsTable, Threshold>),
      Threshold,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubjectTableTableManager get subject =>
      $$SubjectTableTableManager(_db, _db.subject);
  $$ThresholdsTableTableManager get thresholds =>
      $$ThresholdsTableTableManager(_db, _db.thresholds);
}
