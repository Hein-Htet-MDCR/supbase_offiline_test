// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VocabularyTableTable extends VocabularyTable
    with TableInfo<$VocabularyTableTable, VocabularyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabularyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readingMeta = const VerificationMeta(
    'reading',
  );
  @override
  late final GeneratedColumn<String> reading = GeneratedColumn<String>(
    'reading',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meaningMeta = const VerificationMeta(
    'meaning',
  );
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
    'meaning',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jlptLevelMeta = const VerificationMeta(
    'jlptLevel',
  );
  @override
  late final GeneratedColumn<int> jlptLevel = GeneratedColumn<int>(
    'jlpt_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isLearnedMeta = const VerificationMeta(
    'isLearned',
  );
  @override
  late final GeneratedColumn<bool> isLearned = GeneratedColumn<bool>(
    'is_learned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_learned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    word,
    reading,
    meaning,
    jlptLevel,
    isFavorite,
    isLearned,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabulary_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VocabularyTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('reading')) {
      context.handle(
        _readingMeta,
        reading.isAcceptableOrUnknown(data['reading']!, _readingMeta),
      );
    } else if (isInserting) {
      context.missing(_readingMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(
        _meaningMeta,
        meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta),
      );
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('jlpt_level')) {
      context.handle(
        _jlptLevelMeta,
        jlptLevel.isAcceptableOrUnknown(data['jlpt_level']!, _jlptLevelMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('is_learned')) {
      context.handle(
        _isLearnedMeta,
        isLearned.isAcceptableOrUnknown(data['is_learned']!, _isLearnedMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabularyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabularyTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      reading: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reading'],
      )!,
      meaning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meaning'],
      )!,
      jlptLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jlpt_level'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      isLearned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_learned'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $VocabularyTableTable createAlias(String alias) {
    return $VocabularyTableTable(attachedDatabase, alias);
  }
}

class VocabularyTableData extends DataClass
    implements Insertable<VocabularyTableData> {
  final String id;
  final String word;
  final String reading;
  final String meaning;
  final int jlptLevel;
  final bool isFavorite;
  final bool isLearned;
  final DateTime updatedAt;
  final bool isSynced;
  const VocabularyTableData({
    required this.id,
    required this.word,
    required this.reading,
    required this.meaning,
    required this.jlptLevel,
    required this.isFavorite,
    required this.isLearned,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['word'] = Variable<String>(word);
    map['reading'] = Variable<String>(reading);
    map['meaning'] = Variable<String>(meaning);
    map['jlpt_level'] = Variable<int>(jlptLevel);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_learned'] = Variable<bool>(isLearned);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  VocabularyTableCompanion toCompanion(bool nullToAbsent) {
    return VocabularyTableCompanion(
      id: Value(id),
      word: Value(word),
      reading: Value(reading),
      meaning: Value(meaning),
      jlptLevel: Value(jlptLevel),
      isFavorite: Value(isFavorite),
      isLearned: Value(isLearned),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory VocabularyTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabularyTableData(
      id: serializer.fromJson<String>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      reading: serializer.fromJson<String>(json['reading']),
      meaning: serializer.fromJson<String>(json['meaning']),
      jlptLevel: serializer.fromJson<int>(json['jlptLevel']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isLearned: serializer.fromJson<bool>(json['isLearned']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'word': serializer.toJson<String>(word),
      'reading': serializer.toJson<String>(reading),
      'meaning': serializer.toJson<String>(meaning),
      'jlptLevel': serializer.toJson<int>(jlptLevel),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isLearned': serializer.toJson<bool>(isLearned),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  VocabularyTableData copyWith({
    String? id,
    String? word,
    String? reading,
    String? meaning,
    int? jlptLevel,
    bool? isFavorite,
    bool? isLearned,
    DateTime? updatedAt,
    bool? isSynced,
  }) => VocabularyTableData(
    id: id ?? this.id,
    word: word ?? this.word,
    reading: reading ?? this.reading,
    meaning: meaning ?? this.meaning,
    jlptLevel: jlptLevel ?? this.jlptLevel,
    isFavorite: isFavorite ?? this.isFavorite,
    isLearned: isLearned ?? this.isLearned,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  VocabularyTableData copyWithCompanion(VocabularyTableCompanion data) {
    return VocabularyTableData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      reading: data.reading.present ? data.reading.value : this.reading,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
      jlptLevel: data.jlptLevel.present ? data.jlptLevel.value : this.jlptLevel,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      isLearned: data.isLearned.present ? data.isLearned.value : this.isLearned,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyTableData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('reading: $reading, ')
          ..write('meaning: $meaning, ')
          ..write('jlptLevel: $jlptLevel, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isLearned: $isLearned, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    word,
    reading,
    meaning,
    jlptLevel,
    isFavorite,
    isLearned,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabularyTableData &&
          other.id == this.id &&
          other.word == this.word &&
          other.reading == this.reading &&
          other.meaning == this.meaning &&
          other.jlptLevel == this.jlptLevel &&
          other.isFavorite == this.isFavorite &&
          other.isLearned == this.isLearned &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class VocabularyTableCompanion extends UpdateCompanion<VocabularyTableData> {
  final Value<String> id;
  final Value<String> word;
  final Value<String> reading;
  final Value<String> meaning;
  final Value<int> jlptLevel;
  final Value<bool> isFavorite;
  final Value<bool> isLearned;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const VocabularyTableCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.reading = const Value.absent(),
    this.meaning = const Value.absent(),
    this.jlptLevel = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VocabularyTableCompanion.insert({
    required String id,
    required String word,
    required String reading,
    required String meaning,
    this.jlptLevel = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       word = Value(word),
       reading = Value(reading),
       meaning = Value(meaning);
  static Insertable<VocabularyTableData> custom({
    Expression<String>? id,
    Expression<String>? word,
    Expression<String>? reading,
    Expression<String>? meaning,
    Expression<int>? jlptLevel,
    Expression<bool>? isFavorite,
    Expression<bool>? isLearned,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (reading != null) 'reading': reading,
      if (meaning != null) 'meaning': meaning,
      if (jlptLevel != null) 'jlpt_level': jlptLevel,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isLearned != null) 'is_learned': isLearned,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VocabularyTableCompanion copyWith({
    Value<String>? id,
    Value<String>? word,
    Value<String>? reading,
    Value<String>? meaning,
    Value<int>? jlptLevel,
    Value<bool>? isFavorite,
    Value<bool>? isLearned,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return VocabularyTableCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      reading: reading ?? this.reading,
      meaning: meaning ?? this.meaning,
      jlptLevel: jlptLevel ?? this.jlptLevel,
      isFavorite: isFavorite ?? this.isFavorite,
      isLearned: isLearned ?? this.isLearned,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (reading.present) {
      map['reading'] = Variable<String>(reading.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (jlptLevel.present) {
      map['jlpt_level'] = Variable<int>(jlptLevel.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isLearned.present) {
      map['is_learned'] = Variable<bool>(isLearned.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyTableCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('reading: $reading, ')
          ..write('meaning: $meaning, ')
          ..write('jlptLevel: $jlptLevel, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isLearned: $isLearned, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KanjiTableTable extends KanjiTable
    with TableInfo<$KanjiTableTable, KanjiTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KanjiTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterMeta = const VerificationMeta(
    'character',
  );
  @override
  late final GeneratedColumn<String> character = GeneratedColumn<String>(
    'character',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meaningsMeta = const VerificationMeta(
    'meanings',
  );
  @override
  late final GeneratedColumn<String> meanings = GeneratedColumn<String>(
    'meanings',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _onyomiMeta = const VerificationMeta('onyomi');
  @override
  late final GeneratedColumn<String> onyomi = GeneratedColumn<String>(
    'onyomi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kunyomiMeta = const VerificationMeta(
    'kunyomi',
  );
  @override
  late final GeneratedColumn<String> kunyomi = GeneratedColumn<String>(
    'kunyomi',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strokeCountMeta = const VerificationMeta(
    'strokeCount',
  );
  @override
  late final GeneratedColumn<int> strokeCount = GeneratedColumn<int>(
    'stroke_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _jlptLevelMeta = const VerificationMeta(
    'jlptLevel',
  );
  @override
  late final GeneratedColumn<int> jlptLevel = GeneratedColumn<int>(
    'jlpt_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isLearnedMeta = const VerificationMeta(
    'isLearned',
  );
  @override
  late final GeneratedColumn<bool> isLearned = GeneratedColumn<bool>(
    'is_learned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_learned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    character,
    meanings,
    onyomi,
    kunyomi,
    strokeCount,
    jlptLevel,
    isFavorite,
    isLearned,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kanji_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<KanjiTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character')) {
      context.handle(
        _characterMeta,
        character.isAcceptableOrUnknown(data['character']!, _characterMeta),
      );
    } else if (isInserting) {
      context.missing(_characterMeta);
    }
    if (data.containsKey('meanings')) {
      context.handle(
        _meaningsMeta,
        meanings.isAcceptableOrUnknown(data['meanings']!, _meaningsMeta),
      );
    } else if (isInserting) {
      context.missing(_meaningsMeta);
    }
    if (data.containsKey('onyomi')) {
      context.handle(
        _onyomiMeta,
        onyomi.isAcceptableOrUnknown(data['onyomi']!, _onyomiMeta),
      );
    } else if (isInserting) {
      context.missing(_onyomiMeta);
    }
    if (data.containsKey('kunyomi')) {
      context.handle(
        _kunyomiMeta,
        kunyomi.isAcceptableOrUnknown(data['kunyomi']!, _kunyomiMeta),
      );
    } else if (isInserting) {
      context.missing(_kunyomiMeta);
    }
    if (data.containsKey('stroke_count')) {
      context.handle(
        _strokeCountMeta,
        strokeCount.isAcceptableOrUnknown(
          data['stroke_count']!,
          _strokeCountMeta,
        ),
      );
    }
    if (data.containsKey('jlpt_level')) {
      context.handle(
        _jlptLevelMeta,
        jlptLevel.isAcceptableOrUnknown(data['jlpt_level']!, _jlptLevelMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('is_learned')) {
      context.handle(
        _isLearnedMeta,
        isLearned.isAcceptableOrUnknown(data['is_learned']!, _isLearnedMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KanjiTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KanjiTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      character: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character'],
      )!,
      meanings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meanings'],
      )!,
      onyomi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}onyomi'],
      )!,
      kunyomi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kunyomi'],
      )!,
      strokeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stroke_count'],
      )!,
      jlptLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jlpt_level'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      isLearned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_learned'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $KanjiTableTable createAlias(String alias) {
    return $KanjiTableTable(attachedDatabase, alias);
  }
}

class KanjiTableData extends DataClass implements Insertable<KanjiTableData> {
  final String id;
  final String character;
  final String meanings;
  final String onyomi;
  final String kunyomi;
  final int strokeCount;
  final int jlptLevel;
  final bool isFavorite;
  final bool isLearned;
  final DateTime updatedAt;
  final bool isSynced;
  const KanjiTableData({
    required this.id,
    required this.character,
    required this.meanings,
    required this.onyomi,
    required this.kunyomi,
    required this.strokeCount,
    required this.jlptLevel,
    required this.isFavorite,
    required this.isLearned,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character'] = Variable<String>(character);
    map['meanings'] = Variable<String>(meanings);
    map['onyomi'] = Variable<String>(onyomi);
    map['kunyomi'] = Variable<String>(kunyomi);
    map['stroke_count'] = Variable<int>(strokeCount);
    map['jlpt_level'] = Variable<int>(jlptLevel);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_learned'] = Variable<bool>(isLearned);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  KanjiTableCompanion toCompanion(bool nullToAbsent) {
    return KanjiTableCompanion(
      id: Value(id),
      character: Value(character),
      meanings: Value(meanings),
      onyomi: Value(onyomi),
      kunyomi: Value(kunyomi),
      strokeCount: Value(strokeCount),
      jlptLevel: Value(jlptLevel),
      isFavorite: Value(isFavorite),
      isLearned: Value(isLearned),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory KanjiTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KanjiTableData(
      id: serializer.fromJson<String>(json['id']),
      character: serializer.fromJson<String>(json['character']),
      meanings: serializer.fromJson<String>(json['meanings']),
      onyomi: serializer.fromJson<String>(json['onyomi']),
      kunyomi: serializer.fromJson<String>(json['kunyomi']),
      strokeCount: serializer.fromJson<int>(json['strokeCount']),
      jlptLevel: serializer.fromJson<int>(json['jlptLevel']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isLearned: serializer.fromJson<bool>(json['isLearned']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'character': serializer.toJson<String>(character),
      'meanings': serializer.toJson<String>(meanings),
      'onyomi': serializer.toJson<String>(onyomi),
      'kunyomi': serializer.toJson<String>(kunyomi),
      'strokeCount': serializer.toJson<int>(strokeCount),
      'jlptLevel': serializer.toJson<int>(jlptLevel),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isLearned': serializer.toJson<bool>(isLearned),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  KanjiTableData copyWith({
    String? id,
    String? character,
    String? meanings,
    String? onyomi,
    String? kunyomi,
    int? strokeCount,
    int? jlptLevel,
    bool? isFavorite,
    bool? isLearned,
    DateTime? updatedAt,
    bool? isSynced,
  }) => KanjiTableData(
    id: id ?? this.id,
    character: character ?? this.character,
    meanings: meanings ?? this.meanings,
    onyomi: onyomi ?? this.onyomi,
    kunyomi: kunyomi ?? this.kunyomi,
    strokeCount: strokeCount ?? this.strokeCount,
    jlptLevel: jlptLevel ?? this.jlptLevel,
    isFavorite: isFavorite ?? this.isFavorite,
    isLearned: isLearned ?? this.isLearned,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  KanjiTableData copyWithCompanion(KanjiTableCompanion data) {
    return KanjiTableData(
      id: data.id.present ? data.id.value : this.id,
      character: data.character.present ? data.character.value : this.character,
      meanings: data.meanings.present ? data.meanings.value : this.meanings,
      onyomi: data.onyomi.present ? data.onyomi.value : this.onyomi,
      kunyomi: data.kunyomi.present ? data.kunyomi.value : this.kunyomi,
      strokeCount: data.strokeCount.present
          ? data.strokeCount.value
          : this.strokeCount,
      jlptLevel: data.jlptLevel.present ? data.jlptLevel.value : this.jlptLevel,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      isLearned: data.isLearned.present ? data.isLearned.value : this.isLearned,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KanjiTableData(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('meanings: $meanings, ')
          ..write('onyomi: $onyomi, ')
          ..write('kunyomi: $kunyomi, ')
          ..write('strokeCount: $strokeCount, ')
          ..write('jlptLevel: $jlptLevel, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isLearned: $isLearned, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    character,
    meanings,
    onyomi,
    kunyomi,
    strokeCount,
    jlptLevel,
    isFavorite,
    isLearned,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KanjiTableData &&
          other.id == this.id &&
          other.character == this.character &&
          other.meanings == this.meanings &&
          other.onyomi == this.onyomi &&
          other.kunyomi == this.kunyomi &&
          other.strokeCount == this.strokeCount &&
          other.jlptLevel == this.jlptLevel &&
          other.isFavorite == this.isFavorite &&
          other.isLearned == this.isLearned &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class KanjiTableCompanion extends UpdateCompanion<KanjiTableData> {
  final Value<String> id;
  final Value<String> character;
  final Value<String> meanings;
  final Value<String> onyomi;
  final Value<String> kunyomi;
  final Value<int> strokeCount;
  final Value<int> jlptLevel;
  final Value<bool> isFavorite;
  final Value<bool> isLearned;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const KanjiTableCompanion({
    this.id = const Value.absent(),
    this.character = const Value.absent(),
    this.meanings = const Value.absent(),
    this.onyomi = const Value.absent(),
    this.kunyomi = const Value.absent(),
    this.strokeCount = const Value.absent(),
    this.jlptLevel = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KanjiTableCompanion.insert({
    required String id,
    required String character,
    required String meanings,
    required String onyomi,
    required String kunyomi,
    this.strokeCount = const Value.absent(),
    this.jlptLevel = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       character = Value(character),
       meanings = Value(meanings),
       onyomi = Value(onyomi),
       kunyomi = Value(kunyomi);
  static Insertable<KanjiTableData> custom({
    Expression<String>? id,
    Expression<String>? character,
    Expression<String>? meanings,
    Expression<String>? onyomi,
    Expression<String>? kunyomi,
    Expression<int>? strokeCount,
    Expression<int>? jlptLevel,
    Expression<bool>? isFavorite,
    Expression<bool>? isLearned,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (character != null) 'character': character,
      if (meanings != null) 'meanings': meanings,
      if (onyomi != null) 'onyomi': onyomi,
      if (kunyomi != null) 'kunyomi': kunyomi,
      if (strokeCount != null) 'stroke_count': strokeCount,
      if (jlptLevel != null) 'jlpt_level': jlptLevel,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isLearned != null) 'is_learned': isLearned,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KanjiTableCompanion copyWith({
    Value<String>? id,
    Value<String>? character,
    Value<String>? meanings,
    Value<String>? onyomi,
    Value<String>? kunyomi,
    Value<int>? strokeCount,
    Value<int>? jlptLevel,
    Value<bool>? isFavorite,
    Value<bool>? isLearned,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return KanjiTableCompanion(
      id: id ?? this.id,
      character: character ?? this.character,
      meanings: meanings ?? this.meanings,
      onyomi: onyomi ?? this.onyomi,
      kunyomi: kunyomi ?? this.kunyomi,
      strokeCount: strokeCount ?? this.strokeCount,
      jlptLevel: jlptLevel ?? this.jlptLevel,
      isFavorite: isFavorite ?? this.isFavorite,
      isLearned: isLearned ?? this.isLearned,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (character.present) {
      map['character'] = Variable<String>(character.value);
    }
    if (meanings.present) {
      map['meanings'] = Variable<String>(meanings.value);
    }
    if (onyomi.present) {
      map['onyomi'] = Variable<String>(onyomi.value);
    }
    if (kunyomi.present) {
      map['kunyomi'] = Variable<String>(kunyomi.value);
    }
    if (strokeCount.present) {
      map['stroke_count'] = Variable<int>(strokeCount.value);
    }
    if (jlptLevel.present) {
      map['jlpt_level'] = Variable<int>(jlptLevel.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isLearned.present) {
      map['is_learned'] = Variable<bool>(isLearned.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KanjiTableCompanion(')
          ..write('id: $id, ')
          ..write('character: $character, ')
          ..write('meanings: $meanings, ')
          ..write('onyomi: $onyomi, ')
          ..write('kunyomi: $kunyomi, ')
          ..write('strokeCount: $strokeCount, ')
          ..write('jlptLevel: $jlptLevel, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isLearned: $isLearned, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuizResultTableTable extends QuizResultTable
    with TableInfo<$QuizResultTableTable, QuizResultTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizResultTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quizTypeMeta = const VerificationMeta(
    'quizType',
  );
  @override
  late final GeneratedColumn<String> quizType = GeneratedColumn<String>(
    'quiz_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalQuestionsMeta = const VerificationMeta(
    'totalQuestions',
  );
  @override
  late final GeneratedColumn<int> totalQuestions = GeneratedColumn<int>(
    'total_questions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    quizType,
    score,
    totalQuestions,
    completedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz_result_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuizResultTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('quiz_type')) {
      context.handle(
        _quizTypeMeta,
        quizType.isAcceptableOrUnknown(data['quiz_type']!, _quizTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_quizTypeMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('total_questions')) {
      context.handle(
        _totalQuestionsMeta,
        totalQuestions.isAcceptableOrUnknown(
          data['total_questions']!,
          _totalQuestionsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalQuestionsMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizResultTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizResultTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      quizType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiz_type'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      totalQuestions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_questions'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $QuizResultTableTable createAlias(String alias) {
    return $QuizResultTableTable(attachedDatabase, alias);
  }
}

class QuizResultTableData extends DataClass
    implements Insertable<QuizResultTableData> {
  final String id;
  final String userId;
  final String quizType;
  final int score;
  final int totalQuestions;
  final DateTime completedAt;
  final bool isSynced;
  const QuizResultTableData({
    required this.id,
    required this.userId,
    required this.quizType,
    required this.score,
    required this.totalQuestions,
    required this.completedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['quiz_type'] = Variable<String>(quizType);
    map['score'] = Variable<int>(score);
    map['total_questions'] = Variable<int>(totalQuestions);
    map['completed_at'] = Variable<DateTime>(completedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  QuizResultTableCompanion toCompanion(bool nullToAbsent) {
    return QuizResultTableCompanion(
      id: Value(id),
      userId: Value(userId),
      quizType: Value(quizType),
      score: Value(score),
      totalQuestions: Value(totalQuestions),
      completedAt: Value(completedAt),
      isSynced: Value(isSynced),
    );
  }

  factory QuizResultTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizResultTableData(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      quizType: serializer.fromJson<String>(json['quizType']),
      score: serializer.fromJson<int>(json['score']),
      totalQuestions: serializer.fromJson<int>(json['totalQuestions']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'quizType': serializer.toJson<String>(quizType),
      'score': serializer.toJson<int>(score),
      'totalQuestions': serializer.toJson<int>(totalQuestions),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  QuizResultTableData copyWith({
    String? id,
    String? userId,
    String? quizType,
    int? score,
    int? totalQuestions,
    DateTime? completedAt,
    bool? isSynced,
  }) => QuizResultTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    quizType: quizType ?? this.quizType,
    score: score ?? this.score,
    totalQuestions: totalQuestions ?? this.totalQuestions,
    completedAt: completedAt ?? this.completedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  QuizResultTableData copyWithCompanion(QuizResultTableCompanion data) {
    return QuizResultTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      quizType: data.quizType.present ? data.quizType.value : this.quizType,
      score: data.score.present ? data.score.value : this.score,
      totalQuestions: data.totalQuestions.present
          ? data.totalQuestions.value
          : this.totalQuestions,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizResultTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('quizType: $quizType, ')
          ..write('score: $score, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('completedAt: $completedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    quizType,
    score,
    totalQuestions,
    completedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizResultTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.quizType == this.quizType &&
          other.score == this.score &&
          other.totalQuestions == this.totalQuestions &&
          other.completedAt == this.completedAt &&
          other.isSynced == this.isSynced);
}

class QuizResultTableCompanion extends UpdateCompanion<QuizResultTableData> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> quizType;
  final Value<int> score;
  final Value<int> totalQuestions;
  final Value<DateTime> completedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const QuizResultTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.quizType = const Value.absent(),
    this.score = const Value.absent(),
    this.totalQuestions = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuizResultTableCompanion.insert({
    required String id,
    required String userId,
    required String quizType,
    required int score,
    required int totalQuestions,
    this.completedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       quizType = Value(quizType),
       score = Value(score),
       totalQuestions = Value(totalQuestions);
  static Insertable<QuizResultTableData> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? quizType,
    Expression<int>? score,
    Expression<int>? totalQuestions,
    Expression<DateTime>? completedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (quizType != null) 'quiz_type': quizType,
      if (score != null) 'score': score,
      if (totalQuestions != null) 'total_questions': totalQuestions,
      if (completedAt != null) 'completed_at': completedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuizResultTableCompanion copyWith({
    Value<String>? id,
    Value<String>? userId,
    Value<String>? quizType,
    Value<int>? score,
    Value<int>? totalQuestions,
    Value<DateTime>? completedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return QuizResultTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      quizType: quizType ?? this.quizType,
      score: score ?? this.score,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      completedAt: completedAt ?? this.completedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (quizType.present) {
      map['quiz_type'] = Variable<String>(quizType.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (totalQuestions.present) {
      map['total_questions'] = Variable<int>(totalQuestions.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizResultTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('quizType: $quizType, ')
          ..write('score: $score, ')
          ..write('totalQuestions: $totalQuestions, ')
          ..write('completedAt: $completedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserStreakTableTable extends UserStreakTable
    with TableInfo<$UserStreakTableTable, UserStreakTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserStreakTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentStreakMeta = const VerificationMeta(
    'currentStreak',
  );
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
    'current_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _longestStreakMeta = const VerificationMeta(
    'longestStreak',
  );
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
    'longest_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastActivityDateMeta = const VerificationMeta(
    'lastActivityDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastActivityDate =
      GeneratedColumn<DateTime>(
        'last_activity_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _totalPointsMeta = const VerificationMeta(
    'totalPoints',
  );
  @override
  late final GeneratedColumn<int> totalPoints = GeneratedColumn<int>(
    'total_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    currentStreak,
    longestStreak,
    lastActivityDate,
    totalPoints,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_streak_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserStreakTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('current_streak')) {
      context.handle(
        _currentStreakMeta,
        currentStreak.isAcceptableOrUnknown(
          data['current_streak']!,
          _currentStreakMeta,
        ),
      );
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
        _longestStreakMeta,
        longestStreak.isAcceptableOrUnknown(
          data['longest_streak']!,
          _longestStreakMeta,
        ),
      );
    }
    if (data.containsKey('last_activity_date')) {
      context.handle(
        _lastActivityDateMeta,
        lastActivityDate.isAcceptableOrUnknown(
          data['last_activity_date']!,
          _lastActivityDateMeta,
        ),
      );
    }
    if (data.containsKey('total_points')) {
      context.handle(
        _totalPointsMeta,
        totalPoints.isAcceptableOrUnknown(
          data['total_points']!,
          _totalPointsMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserStreakTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserStreakTableData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      currentStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_streak'],
      )!,
      longestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak'],
      )!,
      lastActivityDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_activity_date'],
      ),
      totalPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_points'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $UserStreakTableTable createAlias(String alias) {
    return $UserStreakTableTable(attachedDatabase, alias);
  }
}

class UserStreakTableData extends DataClass
    implements Insertable<UserStreakTableData> {
  final String userId;
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastActivityDate;
  final int totalPoints;
  final DateTime updatedAt;
  final bool isSynced;
  const UserStreakTableData({
    required this.userId,
    required this.currentStreak,
    required this.longestStreak,
    this.lastActivityDate,
    required this.totalPoints,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    if (!nullToAbsent || lastActivityDate != null) {
      map['last_activity_date'] = Variable<DateTime>(lastActivityDate);
    }
    map['total_points'] = Variable<int>(totalPoints);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  UserStreakTableCompanion toCompanion(bool nullToAbsent) {
    return UserStreakTableCompanion(
      userId: Value(userId),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      lastActivityDate: lastActivityDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActivityDate),
      totalPoints: Value(totalPoints),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory UserStreakTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserStreakTableData(
      userId: serializer.fromJson<String>(json['userId']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      lastActivityDate: serializer.fromJson<DateTime?>(
        json['lastActivityDate'],
      ),
      totalPoints: serializer.fromJson<int>(json['totalPoints']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'lastActivityDate': serializer.toJson<DateTime?>(lastActivityDate),
      'totalPoints': serializer.toJson<int>(totalPoints),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  UserStreakTableData copyWith({
    String? userId,
    int? currentStreak,
    int? longestStreak,
    Value<DateTime?> lastActivityDate = const Value.absent(),
    int? totalPoints,
    DateTime? updatedAt,
    bool? isSynced,
  }) => UserStreakTableData(
    userId: userId ?? this.userId,
    currentStreak: currentStreak ?? this.currentStreak,
    longestStreak: longestStreak ?? this.longestStreak,
    lastActivityDate: lastActivityDate.present
        ? lastActivityDate.value
        : this.lastActivityDate,
    totalPoints: totalPoints ?? this.totalPoints,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  UserStreakTableData copyWithCompanion(UserStreakTableCompanion data) {
    return UserStreakTableData(
      userId: data.userId.present ? data.userId.value : this.userId,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      lastActivityDate: data.lastActivityDate.present
          ? data.lastActivityDate.value
          : this.lastActivityDate,
      totalPoints: data.totalPoints.present
          ? data.totalPoints.value
          : this.totalPoints,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserStreakTableData(')
          ..write('userId: $userId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastActivityDate: $lastActivityDate, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    userId,
    currentStreak,
    longestStreak,
    lastActivityDate,
    totalPoints,
    updatedAt,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserStreakTableData &&
          other.userId == this.userId &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.lastActivityDate == this.lastActivityDate &&
          other.totalPoints == this.totalPoints &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class UserStreakTableCompanion extends UpdateCompanion<UserStreakTableData> {
  final Value<String> userId;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<DateTime?> lastActivityDate;
  final Value<int> totalPoints;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const UserStreakTableCompanion({
    this.userId = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastActivityDate = const Value.absent(),
    this.totalPoints = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserStreakTableCompanion.insert({
    required String userId,
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.lastActivityDate = const Value.absent(),
    this.totalPoints = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<UserStreakTableData> custom({
    Expression<String>? userId,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<DateTime>? lastActivityDate,
    Expression<int>? totalPoints,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (lastActivityDate != null) 'last_activity_date': lastActivityDate,
      if (totalPoints != null) 'total_points': totalPoints,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserStreakTableCompanion copyWith({
    Value<String>? userId,
    Value<int>? currentStreak,
    Value<int>? longestStreak,
    Value<DateTime?>? lastActivityDate,
    Value<int>? totalPoints,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return UserStreakTableCompanion(
      userId: userId ?? this.userId,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastActivityDate: lastActivityDate ?? this.lastActivityDate,
      totalPoints: totalPoints ?? this.totalPoints,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (lastActivityDate.present) {
      map['last_activity_date'] = Variable<DateTime>(lastActivityDate.value);
    }
    if (totalPoints.present) {
      map['total_points'] = Variable<int>(totalPoints.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserStreakTableCompanion(')
          ..write('userId: $userId, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('lastActivityDate: $lastActivityDate, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTableTable extends SyncQueueTable
    with TableInfo<$SyncQueueTableTable, SyncQueueTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _operationMeta = const VerificationMeta(
    'operation',
  );
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
    'operation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastErrorMeta = const VerificationMeta(
    'lastError',
  );
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
    'last_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entityType,
    entityId,
    operation,
    payload,
    createdAt,
    retryCount,
    lastError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncQueueTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(
        _operationMeta,
        operation.isAcceptableOrUnknown(data['operation']!, _operationMeta),
      );
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('last_error')) {
      context.handle(
        _lastErrorMeta,
        lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_id'],
      )!,
      operation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operation'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      lastError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_error'],
      ),
    );
  }

  @override
  $SyncQueueTableTable createAlias(String alias) {
    return $SyncQueueTableTable(attachedDatabase, alias);
  }
}

class SyncQueueTableData extends DataClass
    implements Insertable<SyncQueueTableData> {
  final int id;
  final String entityType;
  final String entityId;
  final String operation;
  final String payload;
  final DateTime createdAt;
  final int retryCount;
  final String? lastError;
  const SyncQueueTableData({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.payload,
    required this.createdAt,
    required this.retryCount,
    this.lastError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  SyncQueueTableCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueTableCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operation: Value(operation),
      payload: Value(payload),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory SyncQueueTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueTableData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  SyncQueueTableData copyWith({
    int? id,
    String? entityType,
    String? entityId,
    String? operation,
    String? payload,
    DateTime? createdAt,
    int? retryCount,
    Value<String?> lastError = const Value.absent(),
  }) => SyncQueueTableData(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    operation: operation ?? this.operation,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
    retryCount: retryCount ?? this.retryCount,
    lastError: lastError.present ? lastError.value : this.lastError,
  );
  SyncQueueTableData copyWithCompanion(SyncQueueTableCompanion data) {
    return SyncQueueTableData(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    entityType,
    entityId,
    operation,
    payload,
    createdAt,
    retryCount,
    lastError,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueTableData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError);
}

class SyncQueueTableCompanion extends UpdateCompanion<SyncQueueTableData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  final Value<int> retryCount;
  final Value<String?> lastError;
  const SyncQueueTableCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  SyncQueueTableCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required String operation,
    required String payload,
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  }) : entityType = Value(entityType),
       entityId = Value(entityId),
       operation = Value(operation),
       payload = Value(payload);
  static Insertable<SyncQueueTableData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
    Expression<int>? retryCount,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
    });
  }

  SyncQueueTableCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String>? operation,
    Value<String>? payload,
    Value<DateTime>? createdAt,
    Value<int>? retryCount,
    Value<String?>? lastError,
  }) {
    return SyncQueueTableCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

class $UserProfileTableTable extends UserProfileTable
    with TableInfo<$UserProfileTableTable, UserProfileTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isAnonymousMeta = const VerificationMeta(
    'isAnonymous',
  );
  @override
  late final GeneratedColumn<bool> isAnonymous = GeneratedColumn<bool>(
    'is_anonymous',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_anonymous" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    displayName,
    isAnonymous,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profile_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('is_anonymous')) {
      context.handle(
        _isAnonymousMeta,
        isAnonymous.isAcceptableOrUnknown(
          data['is_anonymous']!,
          _isAnonymousMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfileTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      isAnonymous: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_anonymous'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserProfileTableTable createAlias(String alias) {
    return $UserProfileTableTable(attachedDatabase, alias);
  }
}

class UserProfileTableData extends DataClass
    implements Insertable<UserProfileTableData> {
  final String id;
  final String? email;
  final String? displayName;
  final bool isAnonymous;
  final DateTime createdAt;
  const UserProfileTableData({
    required this.id,
    this.email,
    this.displayName,
    required this.isAnonymous,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    map['is_anonymous'] = Variable<bool>(isAnonymous);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserProfileTableCompanion toCompanion(bool nullToAbsent) {
    return UserProfileTableCompanion(
      id: Value(id),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      isAnonymous: Value(isAnonymous),
      createdAt: Value(createdAt),
    );
  }

  factory UserProfileTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileTableData(
      id: serializer.fromJson<String>(json['id']),
      email: serializer.fromJson<String?>(json['email']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      isAnonymous: serializer.fromJson<bool>(json['isAnonymous']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'email': serializer.toJson<String?>(email),
      'displayName': serializer.toJson<String?>(displayName),
      'isAnonymous': serializer.toJson<bool>(isAnonymous),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserProfileTableData copyWith({
    String? id,
    Value<String?> email = const Value.absent(),
    Value<String?> displayName = const Value.absent(),
    bool? isAnonymous,
    DateTime? createdAt,
  }) => UserProfileTableData(
    id: id ?? this.id,
    email: email.present ? email.value : this.email,
    displayName: displayName.present ? displayName.value : this.displayName,
    isAnonymous: isAnonymous ?? this.isAnonymous,
    createdAt: createdAt ?? this.createdAt,
  );
  UserProfileTableData copyWithCompanion(UserProfileTableCompanion data) {
    return UserProfileTableData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      isAnonymous: data.isAnonymous.present
          ? data.isAnonymous.value
          : this.isAnonymous,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileTableData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, email, displayName, isAnonymous, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileTableData &&
          other.id == this.id &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.isAnonymous == this.isAnonymous &&
          other.createdAt == this.createdAt);
}

class UserProfileTableCompanion extends UpdateCompanion<UserProfileTableData> {
  final Value<String> id;
  final Value<String?> email;
  final Value<String?> displayName;
  final Value<bool> isAnonymous;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UserProfileTableCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.isAnonymous = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfileTableCompanion.insert({
    required String id,
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.isAnonymous = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<UserProfileTableData> custom({
    Expression<String>? id,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<bool>? isAnonymous,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (isAnonymous != null) 'is_anonymous': isAnonymous,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfileTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? email,
    Value<String?>? displayName,
    Value<bool>? isAnonymous,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UserProfileTableCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (isAnonymous.present) {
      map['is_anonymous'] = Variable<bool>(isAnonymous.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileTableCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('isAnonymous: $isAnonymous, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VocabularyTableTable vocabularyTable = $VocabularyTableTable(
    this,
  );
  late final $KanjiTableTable kanjiTable = $KanjiTableTable(this);
  late final $QuizResultTableTable quizResultTable = $QuizResultTableTable(
    this,
  );
  late final $UserStreakTableTable userStreakTable = $UserStreakTableTable(
    this,
  );
  late final $SyncQueueTableTable syncQueueTable = $SyncQueueTableTable(this);
  late final $UserProfileTableTable userProfileTable = $UserProfileTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vocabularyTable,
    kanjiTable,
    quizResultTable,
    userStreakTable,
    syncQueueTable,
    userProfileTable,
  ];
}

typedef $$VocabularyTableTableCreateCompanionBuilder =
    VocabularyTableCompanion Function({
      required String id,
      required String word,
      required String reading,
      required String meaning,
      Value<int> jlptLevel,
      Value<bool> isFavorite,
      Value<bool> isLearned,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$VocabularyTableTableUpdateCompanionBuilder =
    VocabularyTableCompanion Function({
      Value<String> id,
      Value<String> word,
      Value<String> reading,
      Value<String> meaning,
      Value<int> jlptLevel,
      Value<bool> isFavorite,
      Value<bool> isLearned,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$VocabularyTableTableFilterComposer
    extends Composer<_$AppDatabase, $VocabularyTableTable> {
  $$VocabularyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reading => $composableBuilder(
    column: $table.reading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jlptLevel => $composableBuilder(
    column: $table.jlptLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VocabularyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VocabularyTableTable> {
  $$VocabularyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reading => $composableBuilder(
    column: $table.reading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jlptLevel => $composableBuilder(
    column: $table.jlptLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VocabularyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VocabularyTableTable> {
  $$VocabularyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get reading =>
      $composableBuilder(column: $table.reading, builder: (column) => column);

  GeneratedColumn<String> get meaning =>
      $composableBuilder(column: $table.meaning, builder: (column) => column);

  GeneratedColumn<int> get jlptLevel =>
      $composableBuilder(column: $table.jlptLevel, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLearned =>
      $composableBuilder(column: $table.isLearned, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$VocabularyTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VocabularyTableTable,
          VocabularyTableData,
          $$VocabularyTableTableFilterComposer,
          $$VocabularyTableTableOrderingComposer,
          $$VocabularyTableTableAnnotationComposer,
          $$VocabularyTableTableCreateCompanionBuilder,
          $$VocabularyTableTableUpdateCompanionBuilder,
          (
            VocabularyTableData,
            BaseReferences<
              _$AppDatabase,
              $VocabularyTableTable,
              VocabularyTableData
            >,
          ),
          VocabularyTableData,
          PrefetchHooks Function()
        > {
  $$VocabularyTableTableTableManager(
    _$AppDatabase db,
    $VocabularyTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VocabularyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VocabularyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VocabularyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<String> reading = const Value.absent(),
                Value<String> meaning = const Value.absent(),
                Value<int> jlptLevel = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VocabularyTableCompanion(
                id: id,
                word: word,
                reading: reading,
                meaning: meaning,
                jlptLevel: jlptLevel,
                isFavorite: isFavorite,
                isLearned: isLearned,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String word,
                required String reading,
                required String meaning,
                Value<int> jlptLevel = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VocabularyTableCompanion.insert(
                id: id,
                word: word,
                reading: reading,
                meaning: meaning,
                jlptLevel: jlptLevel,
                isFavorite: isFavorite,
                isLearned: isLearned,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$VocabularyTableTable, VocabularyTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $VocabularyTableTable,
                    VocabularyTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VocabularyTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VocabularyTableTable,
      VocabularyTableData,
      $$VocabularyTableTableFilterComposer,
      $$VocabularyTableTableOrderingComposer,
      $$VocabularyTableTableAnnotationComposer,
      $$VocabularyTableTableCreateCompanionBuilder,
      $$VocabularyTableTableUpdateCompanionBuilder,
      (
        VocabularyTableData,
        BaseReferences<
          _$AppDatabase,
          $VocabularyTableTable,
          VocabularyTableData
        >,
      ),
      VocabularyTableData,
      PrefetchHooks Function()
    >;
typedef $$KanjiTableTableCreateCompanionBuilder =
    KanjiTableCompanion Function({
      required String id,
      required String character,
      required String meanings,
      required String onyomi,
      required String kunyomi,
      Value<int> strokeCount,
      Value<int> jlptLevel,
      Value<bool> isFavorite,
      Value<bool> isLearned,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$KanjiTableTableUpdateCompanionBuilder =
    KanjiTableCompanion Function({
      Value<String> id,
      Value<String> character,
      Value<String> meanings,
      Value<String> onyomi,
      Value<String> kunyomi,
      Value<int> strokeCount,
      Value<int> jlptLevel,
      Value<bool> isFavorite,
      Value<bool> isLearned,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$KanjiTableTableFilterComposer
    extends Composer<_$AppDatabase, $KanjiTableTable> {
  $$KanjiTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meanings => $composableBuilder(
    column: $table.meanings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get onyomi => $composableBuilder(
    column: $table.onyomi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kunyomi => $composableBuilder(
    column: $table.kunyomi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strokeCount => $composableBuilder(
    column: $table.strokeCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jlptLevel => $composableBuilder(
    column: $table.jlptLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KanjiTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KanjiTableTable> {
  $$KanjiTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get character => $composableBuilder(
    column: $table.character,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meanings => $composableBuilder(
    column: $table.meanings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get onyomi => $composableBuilder(
    column: $table.onyomi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kunyomi => $composableBuilder(
    column: $table.kunyomi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strokeCount => $composableBuilder(
    column: $table.strokeCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jlptLevel => $composableBuilder(
    column: $table.jlptLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KanjiTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KanjiTableTable> {
  $$KanjiTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get character =>
      $composableBuilder(column: $table.character, builder: (column) => column);

  GeneratedColumn<String> get meanings =>
      $composableBuilder(column: $table.meanings, builder: (column) => column);

  GeneratedColumn<String> get onyomi =>
      $composableBuilder(column: $table.onyomi, builder: (column) => column);

  GeneratedColumn<String> get kunyomi =>
      $composableBuilder(column: $table.kunyomi, builder: (column) => column);

  GeneratedColumn<int> get strokeCount => $composableBuilder(
    column: $table.strokeCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get jlptLevel =>
      $composableBuilder(column: $table.jlptLevel, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isLearned =>
      $composableBuilder(column: $table.isLearned, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$KanjiTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KanjiTableTable,
          KanjiTableData,
          $$KanjiTableTableFilterComposer,
          $$KanjiTableTableOrderingComposer,
          $$KanjiTableTableAnnotationComposer,
          $$KanjiTableTableCreateCompanionBuilder,
          $$KanjiTableTableUpdateCompanionBuilder,
          (
            KanjiTableData,
            BaseReferences<_$AppDatabase, $KanjiTableTable, KanjiTableData>,
          ),
          KanjiTableData,
          PrefetchHooks Function()
        > {
  $$KanjiTableTableTableManager(_$AppDatabase db, $KanjiTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KanjiTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KanjiTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KanjiTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> character = const Value.absent(),
                Value<String> meanings = const Value.absent(),
                Value<String> onyomi = const Value.absent(),
                Value<String> kunyomi = const Value.absent(),
                Value<int> strokeCount = const Value.absent(),
                Value<int> jlptLevel = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KanjiTableCompanion(
                id: id,
                character: character,
                meanings: meanings,
                onyomi: onyomi,
                kunyomi: kunyomi,
                strokeCount: strokeCount,
                jlptLevel: jlptLevel,
                isFavorite: isFavorite,
                isLearned: isLearned,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String character,
                required String meanings,
                required String onyomi,
                required String kunyomi,
                Value<int> strokeCount = const Value.absent(),
                Value<int> jlptLevel = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KanjiTableCompanion.insert(
                id: id,
                character: character,
                meanings: meanings,
                onyomi: onyomi,
                kunyomi: kunyomi,
                strokeCount: strokeCount,
                jlptLevel: jlptLevel,
                isFavorite: isFavorite,
                isLearned: isLearned,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$KanjiTableTable, KanjiTableData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $KanjiTableTable,
                    KanjiTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KanjiTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KanjiTableTable,
      KanjiTableData,
      $$KanjiTableTableFilterComposer,
      $$KanjiTableTableOrderingComposer,
      $$KanjiTableTableAnnotationComposer,
      $$KanjiTableTableCreateCompanionBuilder,
      $$KanjiTableTableUpdateCompanionBuilder,
      (
        KanjiTableData,
        BaseReferences<_$AppDatabase, $KanjiTableTable, KanjiTableData>,
      ),
      KanjiTableData,
      PrefetchHooks Function()
    >;
typedef $$QuizResultTableTableCreateCompanionBuilder =
    QuizResultTableCompanion Function({
      required String id,
      required String userId,
      required String quizType,
      required int score,
      required int totalQuestions,
      Value<DateTime> completedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$QuizResultTableTableUpdateCompanionBuilder =
    QuizResultTableCompanion Function({
      Value<String> id,
      Value<String> userId,
      Value<String> quizType,
      Value<int> score,
      Value<int> totalQuestions,
      Value<DateTime> completedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$QuizResultTableTableFilterComposer
    extends Composer<_$AppDatabase, $QuizResultTableTable> {
  $$QuizResultTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quizType => $composableBuilder(
    column: $table.quizType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$QuizResultTableTableOrderingComposer
    extends Composer<_$AppDatabase, $QuizResultTableTable> {
  $$QuizResultTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quizType => $composableBuilder(
    column: $table.quizType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$QuizResultTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuizResultTableTable> {
  $$QuizResultTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get quizType =>
      $composableBuilder(column: $table.quizType, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get totalQuestions => $composableBuilder(
    column: $table.totalQuestions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$QuizResultTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuizResultTableTable,
          QuizResultTableData,
          $$QuizResultTableTableFilterComposer,
          $$QuizResultTableTableOrderingComposer,
          $$QuizResultTableTableAnnotationComposer,
          $$QuizResultTableTableCreateCompanionBuilder,
          $$QuizResultTableTableUpdateCompanionBuilder,
          (
            QuizResultTableData,
            BaseReferences<
              _$AppDatabase,
              $QuizResultTableTable,
              QuizResultTableData
            >,
          ),
          QuizResultTableData,
          PrefetchHooks Function()
        > {
  $$QuizResultTableTableTableManager(
    _$AppDatabase db,
    $QuizResultTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizResultTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizResultTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizResultTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> quizType = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<int> totalQuestions = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizResultTableCompanion(
                id: id,
                userId: userId,
                quizType: quizType,
                score: score,
                totalQuestions: totalQuestions,
                completedAt: completedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String userId,
                required String quizType,
                required int score,
                required int totalQuestions,
                Value<DateTime> completedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => QuizResultTableCompanion.insert(
                id: id,
                userId: userId,
                quizType: quizType,
                score: score,
                totalQuestions: totalQuestions,
                completedAt: completedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuizResultTableTable, QuizResultTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $QuizResultTableTable,
                    QuizResultTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$QuizResultTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuizResultTableTable,
      QuizResultTableData,
      $$QuizResultTableTableFilterComposer,
      $$QuizResultTableTableOrderingComposer,
      $$QuizResultTableTableAnnotationComposer,
      $$QuizResultTableTableCreateCompanionBuilder,
      $$QuizResultTableTableUpdateCompanionBuilder,
      (
        QuizResultTableData,
        BaseReferences<
          _$AppDatabase,
          $QuizResultTableTable,
          QuizResultTableData
        >,
      ),
      QuizResultTableData,
      PrefetchHooks Function()
    >;
typedef $$UserStreakTableTableCreateCompanionBuilder =
    UserStreakTableCompanion Function({
      required String userId,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastActivityDate,
      Value<int> totalPoints,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$UserStreakTableTableUpdateCompanionBuilder =
    UserStreakTableCompanion Function({
      Value<String> userId,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<DateTime?> lastActivityDate,
      Value<int> totalPoints,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$UserStreakTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserStreakTableTable> {
  $$UserStreakTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastActivityDate => $composableBuilder(
    column: $table.lastActivityDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPoints => $composableBuilder(
    column: $table.totalPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserStreakTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserStreakTableTable> {
  $$UserStreakTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastActivityDate => $composableBuilder(
    column: $table.lastActivityDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPoints => $composableBuilder(
    column: $table.totalPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserStreakTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserStreakTableTable> {
  $$UserStreakTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastActivityDate => $composableBuilder(
    column: $table.lastActivityDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalPoints => $composableBuilder(
    column: $table.totalPoints,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$UserStreakTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserStreakTableTable,
          UserStreakTableData,
          $$UserStreakTableTableFilterComposer,
          $$UserStreakTableTableOrderingComposer,
          $$UserStreakTableTableAnnotationComposer,
          $$UserStreakTableTableCreateCompanionBuilder,
          $$UserStreakTableTableUpdateCompanionBuilder,
          (
            UserStreakTableData,
            BaseReferences<
              _$AppDatabase,
              $UserStreakTableTable,
              UserStreakTableData
            >,
          ),
          UserStreakTableData,
          PrefetchHooks Function()
        > {
  $$UserStreakTableTableTableManager(
    _$AppDatabase db,
    $UserStreakTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserStreakTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserStreakTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserStreakTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastActivityDate = const Value.absent(),
                Value<int> totalPoints = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserStreakTableCompanion(
                userId: userId,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastActivityDate: lastActivityDate,
                totalPoints: totalPoints,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<DateTime?> lastActivityDate = const Value.absent(),
                Value<int> totalPoints = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserStreakTableCompanion.insert(
                userId: userId,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                lastActivityDate: lastActivityDate,
                totalPoints: totalPoints,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserStreakTableTable, UserStreakTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $UserStreakTableTable,
                    UserStreakTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserStreakTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserStreakTableTable,
      UserStreakTableData,
      $$UserStreakTableTableFilterComposer,
      $$UserStreakTableTableOrderingComposer,
      $$UserStreakTableTableAnnotationComposer,
      $$UserStreakTableTableCreateCompanionBuilder,
      $$UserStreakTableTableUpdateCompanionBuilder,
      (
        UserStreakTableData,
        BaseReferences<
          _$AppDatabase,
          $UserStreakTableTable,
          UserStreakTableData
        >,
      ),
      UserStreakTableData,
      PrefetchHooks Function()
    >;
typedef $$SyncQueueTableTableCreateCompanionBuilder =
    SyncQueueTableCompanion Function({
      Value<int> id,
      required String entityType,
      required String entityId,
      required String operation,
      required String payload,
      Value<DateTime> createdAt,
      Value<int> retryCount,
      Value<String?> lastError,
    });
typedef $$SyncQueueTableTableUpdateCompanionBuilder =
    SyncQueueTableCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<String> entityId,
      Value<String> operation,
      Value<String> payload,
      Value<DateTime> createdAt,
      Value<int> retryCount,
      Value<String?> lastError,
    });

class $$SyncQueueTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableFilterComposer({
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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncQueueTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableOrderingComposer({
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operation => $composableBuilder(
    column: $table.operation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastError => $composableBuilder(
    column: $table.lastError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncQueueTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$SyncQueueTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncQueueTableTable,
          SyncQueueTableData,
          $$SyncQueueTableTableFilterComposer,
          $$SyncQueueTableTableOrderingComposer,
          $$SyncQueueTableTableAnnotationComposer,
          $$SyncQueueTableTableCreateCompanionBuilder,
          $$SyncQueueTableTableUpdateCompanionBuilder,
          (
            SyncQueueTableData,
            BaseReferences<
              _$AppDatabase,
              $SyncQueueTableTable,
              SyncQueueTableData
            >,
          ),
          SyncQueueTableData,
          PrefetchHooks Function()
        > {
  $$SyncQueueTableTableTableManager(
    _$AppDatabase db,
    $SyncQueueTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String> operation = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => SyncQueueTableCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                retryCount: retryCount,
                lastError: lastError,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required String entityId,
                required String operation,
                required String payload,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> lastError = const Value.absent(),
              }) => SyncQueueTableCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                operation: operation,
                payload: payload,
                createdAt: createdAt,
                retryCount: retryCount,
                lastError: lastError,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SyncQueueTableTable, SyncQueueTableData>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SyncQueueTableTable,
                    SyncQueueTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncQueueTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncQueueTableTable,
      SyncQueueTableData,
      $$SyncQueueTableTableFilterComposer,
      $$SyncQueueTableTableOrderingComposer,
      $$SyncQueueTableTableAnnotationComposer,
      $$SyncQueueTableTableCreateCompanionBuilder,
      $$SyncQueueTableTableUpdateCompanionBuilder,
      (
        SyncQueueTableData,
        BaseReferences<_$AppDatabase, $SyncQueueTableTable, SyncQueueTableData>,
      ),
      SyncQueueTableData,
      PrefetchHooks Function()
    >;
typedef $$UserProfileTableTableCreateCompanionBuilder =
    UserProfileTableCompanion Function({
      required String id,
      Value<String?> email,
      Value<String?> displayName,
      Value<bool> isAnonymous,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$UserProfileTableTableUpdateCompanionBuilder =
    UserProfileTableCompanion Function({
      Value<String> id,
      Value<String?> email,
      Value<String?> displayName,
      Value<bool> isAnonymous,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$UserProfileTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfileTableTable> {
  $$UserProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAnonymous => $composableBuilder(
    column: $table.isAnonymous,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfileTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfileTableTable> {
  $$UserProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAnonymous => $composableBuilder(
    column: $table.isAnonymous,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfileTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfileTableTable> {
  $$UserProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAnonymous => $composableBuilder(
    column: $table.isAnonymous,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UserProfileTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfileTableTable,
          UserProfileTableData,
          $$UserProfileTableTableFilterComposer,
          $$UserProfileTableTableOrderingComposer,
          $$UserProfileTableTableAnnotationComposer,
          $$UserProfileTableTableCreateCompanionBuilder,
          $$UserProfileTableTableUpdateCompanionBuilder,
          (
            UserProfileTableData,
            BaseReferences<
              _$AppDatabase,
              $UserProfileTableTable,
              UserProfileTableData
            >,
          ),
          UserProfileTableData,
          PrefetchHooks Function()
        > {
  $$UserProfileTableTableTableManager(
    _$AppDatabase db,
    $UserProfileTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfileTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfileTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<bool> isAnonymous = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfileTableCompanion(
                id: id,
                email: email,
                displayName: displayName,
                isAnonymous: isAnonymous,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> email = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<bool> isAnonymous = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfileTableCompanion.insert(
                id: id,
                email: email,
                displayName: displayName,
                isAnonymous: isAnonymous,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserProfileTableTable, UserProfileTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $UserProfileTableTable,
                    UserProfileTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfileTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfileTableTable,
      UserProfileTableData,
      $$UserProfileTableTableFilterComposer,
      $$UserProfileTableTableOrderingComposer,
      $$UserProfileTableTableAnnotationComposer,
      $$UserProfileTableTableCreateCompanionBuilder,
      $$UserProfileTableTableUpdateCompanionBuilder,
      (
        UserProfileTableData,
        BaseReferences<
          _$AppDatabase,
          $UserProfileTableTable,
          UserProfileTableData
        >,
      ),
      UserProfileTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VocabularyTableTableTableManager get vocabularyTable =>
      $$VocabularyTableTableTableManager(_db, _db.vocabularyTable);
  $$KanjiTableTableTableManager get kanjiTable =>
      $$KanjiTableTableTableManager(_db, _db.kanjiTable);
  $$QuizResultTableTableTableManager get quizResultTable =>
      $$QuizResultTableTableTableManager(_db, _db.quizResultTable);
  $$UserStreakTableTableTableManager get userStreakTable =>
      $$UserStreakTableTableTableManager(_db, _db.userStreakTable);
  $$SyncQueueTableTableTableManager get syncQueueTable =>
      $$SyncQueueTableTableTableManager(_db, _db.syncQueueTable);
  $$UserProfileTableTableTableManager get userProfileTable =>
      $$UserProfileTableTableTableManager(_db, _db.userProfileTable);
}
