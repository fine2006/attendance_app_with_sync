// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SubjectTable extends Subject with TableInfo<$SubjectTable, SubjectData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectTable(this.attachedDatabase, [this._alias]);
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
  List<GeneratedColumn> get $columns => [name, presentDays, absentDays];
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SubjectData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectData(
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
  final String name;
  final int presentDays;
  final int absentDays;
  const SubjectData({
    required this.name,
    required this.presentDays,
    required this.absentDays,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['present_days'] = Variable<int>(presentDays);
    map['absent_days'] = Variable<int>(absentDays);
    return map;
  }

  SubjectCompanion toCompanion(bool nullToAbsent) {
    return SubjectCompanion(
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
      name: serializer.fromJson<String>(json['name']),
      presentDays: serializer.fromJson<int>(json['presentDays']),
      absentDays: serializer.fromJson<int>(json['absentDays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'presentDays': serializer.toJson<int>(presentDays),
      'absentDays': serializer.toJson<int>(absentDays),
    };
  }

  SubjectData copyWith({String? name, int? presentDays, int? absentDays}) =>
      SubjectData(
        name: name ?? this.name,
        presentDays: presentDays ?? this.presentDays,
        absentDays: absentDays ?? this.absentDays,
      );
  SubjectData copyWithCompanion(SubjectCompanion data) {
    return SubjectData(
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
          ..write('name: $name, ')
          ..write('presentDays: $presentDays, ')
          ..write('absentDays: $absentDays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, presentDays, absentDays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectData &&
          other.name == this.name &&
          other.presentDays == this.presentDays &&
          other.absentDays == this.absentDays);
}

class SubjectCompanion extends UpdateCompanion<SubjectData> {
  final Value<String> name;
  final Value<int> presentDays;
  final Value<int> absentDays;
  final Value<int> rowid;
  const SubjectCompanion({
    this.name = const Value.absent(),
    this.presentDays = const Value.absent(),
    this.absentDays = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectCompanion.insert({
    required String name,
    required int presentDays,
    required int absentDays,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       presentDays = Value(presentDays),
       absentDays = Value(absentDays);
  static Insertable<SubjectData> custom({
    Expression<String>? name,
    Expression<int>? presentDays,
    Expression<int>? absentDays,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (presentDays != null) 'present_days': presentDays,
      if (absentDays != null) 'absent_days': absentDays,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectCompanion copyWith({
    Value<String>? name,
    Value<int>? presentDays,
    Value<int>? absentDays,
    Value<int>? rowid,
  }) {
    return SubjectCompanion(
      name: name ?? this.name,
      presentDays: presentDays ?? this.presentDays,
      absentDays: absentDays ?? this.absentDays,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (presentDays.present) {
      map['present_days'] = Variable<int>(presentDays.value);
    }
    if (absentDays.present) {
      map['absent_days'] = Variable<int>(absentDays.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectCompanion(')
          ..write('name: $name, ')
          ..write('presentDays: $presentDays, ')
          ..write('absentDays: $absentDays, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectTable subject = $SubjectTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [subject];
}

typedef $$SubjectTableCreateCompanionBuilder =
    SubjectCompanion Function({
      required String name,
      required int presentDays,
      required int absentDays,
      Value<int> rowid,
    });
typedef $$SubjectTableUpdateCompanionBuilder =
    SubjectCompanion Function({
      Value<String> name,
      Value<int> presentDays,
      Value<int> absentDays,
      Value<int> rowid,
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
                Value<String> name = const Value.absent(),
                Value<int> presentDays = const Value.absent(),
                Value<int> absentDays = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubjectCompanion(
                name: name,
                presentDays: presentDays,
                absentDays: absentDays,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required int presentDays,
                required int absentDays,
                Value<int> rowid = const Value.absent(),
              }) => SubjectCompanion.insert(
                name: name,
                presentDays: presentDays,
                absentDays: absentDays,
                rowid: rowid,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubjectTableTableManager get subject =>
      $$SubjectTableTableManager(_db, _db.subject);
}
