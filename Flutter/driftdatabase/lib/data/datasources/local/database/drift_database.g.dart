// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Employee extends DataClass implements Insertable<Employee> {
  final int? employeeId;
  final String? employeeName;
  final int? employeeSalary;
  final String? employeeJoiningDate;
  Employee(
      {this.employeeId,
      this.employeeName,
      this.employeeSalary,
      this.employeeJoiningDate});
  factory Employee.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Employee(
      employeeId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}employee_id']),
      employeeName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}employee_name']),
      employeeSalary: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}employee_salary']),
      employeeJoiningDate: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}employee_joining_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || employeeId != null) {
      map['employee_id'] = Variable<int?>(employeeId);
    }
    if (!nullToAbsent || employeeName != null) {
      map['employee_name'] = Variable<String?>(employeeName);
    }
    if (!nullToAbsent || employeeSalary != null) {
      map['employee_salary'] = Variable<int?>(employeeSalary);
    }
    if (!nullToAbsent || employeeJoiningDate != null) {
      map['employee_joining_date'] = Variable<String?>(employeeJoiningDate);
    }
    return map;
  }

  EmployeeTableCompanion toCompanion(bool nullToAbsent) {
    return EmployeeTableCompanion(
      employeeId: employeeId == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeId),
      employeeName: employeeName == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeName),
      employeeSalary: employeeSalary == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeSalary),
      employeeJoiningDate: employeeJoiningDate == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeJoiningDate),
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Employee(
      employeeId: serializer.fromJson<int?>(json['employeeId']),
      employeeName: serializer.fromJson<String?>(json['employeeName']),
      employeeSalary: serializer.fromJson<int?>(json['employeeSalary']),
      employeeJoiningDate:
          serializer.fromJson<String?>(json['employeeJoiningDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'employeeId': serializer.toJson<int?>(employeeId),
      'employeeName': serializer.toJson<String?>(employeeName),
      'employeeSalary': serializer.toJson<int?>(employeeSalary),
      'employeeJoiningDate': serializer.toJson<String?>(employeeJoiningDate),
    };
  }

  Employee copyWith(
          {int? employeeId,
          String? employeeName,
          int? employeeSalary,
          String? employeeJoiningDate}) =>
      Employee(
        employeeId: employeeId ?? this.employeeId,
        employeeName: employeeName ?? this.employeeName,
        employeeSalary: employeeSalary ?? this.employeeSalary,
        employeeJoiningDate: employeeJoiningDate ?? this.employeeJoiningDate,
      );
  @override
  String toString() {
    return (StringBuffer('Employee(')
          ..write('employeeId: $employeeId, ')
          ..write('employeeName: $employeeName, ')
          ..write('employeeSalary: $employeeSalary, ')
          ..write('employeeJoiningDate: $employeeJoiningDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      employeeId, employeeName, employeeSalary, employeeJoiningDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Employee &&
          other.employeeId == this.employeeId &&
          other.employeeName == this.employeeName &&
          other.employeeSalary == this.employeeSalary &&
          other.employeeJoiningDate == this.employeeJoiningDate);
}

class EmployeeTableCompanion extends UpdateCompanion<Employee> {
  final Value<int?> employeeId;
  final Value<String?> employeeName;
  final Value<int?> employeeSalary;
  final Value<String?> employeeJoiningDate;
  const EmployeeTableCompanion({
    this.employeeId = const Value.absent(),
    this.employeeName = const Value.absent(),
    this.employeeSalary = const Value.absent(),
    this.employeeJoiningDate = const Value.absent(),
  });
  EmployeeTableCompanion.insert({
    this.employeeId = const Value.absent(),
    this.employeeName = const Value.absent(),
    this.employeeSalary = const Value.absent(),
    this.employeeJoiningDate = const Value.absent(),
  });
  static Insertable<Employee> custom({
    Expression<int?>? employeeId,
    Expression<String?>? employeeName,
    Expression<int?>? employeeSalary,
    Expression<String?>? employeeJoiningDate,
  }) {
    return RawValuesInsertable({
      if (employeeId != null) 'employee_id': employeeId,
      if (employeeName != null) 'employee_name': employeeName,
      if (employeeSalary != null) 'employee_salary': employeeSalary,
      if (employeeJoiningDate != null)
        'employee_joining_date': employeeJoiningDate,
    });
  }

  EmployeeTableCompanion copyWith(
      {Value<int?>? employeeId,
      Value<String?>? employeeName,
      Value<int?>? employeeSalary,
      Value<String?>? employeeJoiningDate}) {
    return EmployeeTableCompanion(
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      employeeSalary: employeeSalary ?? this.employeeSalary,
      employeeJoiningDate: employeeJoiningDate ?? this.employeeJoiningDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (employeeId.present) {
      map['employee_id'] = Variable<int?>(employeeId.value);
    }
    if (employeeName.present) {
      map['employee_name'] = Variable<String?>(employeeName.value);
    }
    if (employeeSalary.present) {
      map['employee_salary'] = Variable<int?>(employeeSalary.value);
    }
    if (employeeJoiningDate.present) {
      map['employee_joining_date'] =
          Variable<String?>(employeeJoiningDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeTableCompanion(')
          ..write('employeeId: $employeeId, ')
          ..write('employeeName: $employeeName, ')
          ..write('employeeSalary: $employeeSalary, ')
          ..write('employeeJoiningDate: $employeeJoiningDate')
          ..write(')'))
        .toString();
  }
}

class $EmployeeTableTable extends EmployeeTable
    with TableInfo<$EmployeeTableTable, Employee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _employeeIdMeta = const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int?> employeeId = GeneratedColumn<int?>(
      'employee_id', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _employeeNameMeta =
      const VerificationMeta('employeeName');
  @override
  late final GeneratedColumn<String?> employeeName = GeneratedColumn<String?>(
      'employee_name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _employeeSalaryMeta =
      const VerificationMeta('employeeSalary');
  @override
  late final GeneratedColumn<int?> employeeSalary = GeneratedColumn<int?>(
      'employee_salary', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _employeeJoiningDateMeta =
      const VerificationMeta('employeeJoiningDate');
  @override
  late final GeneratedColumn<String?> employeeJoiningDate =
      GeneratedColumn<String?>('employee_joining_date', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [employeeId, employeeName, employeeSalary, employeeJoiningDate];
  @override
  String get aliasedName => _alias ?? 'employee_table';
  @override
  String get actualTableName => 'employee_table';
  @override
  VerificationContext validateIntegrity(Insertable<Employee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    }
    if (data.containsKey('employee_name')) {
      context.handle(
          _employeeNameMeta,
          employeeName.isAcceptableOrUnknown(
              data['employee_name']!, _employeeNameMeta));
    }
    if (data.containsKey('employee_salary')) {
      context.handle(
          _employeeSalaryMeta,
          employeeSalary.isAcceptableOrUnknown(
              data['employee_salary']!, _employeeSalaryMeta));
    }
    if (data.containsKey('employee_joining_date')) {
      context.handle(
          _employeeJoiningDateMeta,
          employeeJoiningDate.isAcceptableOrUnknown(
              data['employee_joining_date']!, _employeeJoiningDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {employeeId};
  @override
  Employee map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Employee.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EmployeeTableTable createAlias(String alias) {
    return $EmployeeTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $EmployeeTableTable employeeTable = $EmployeeTableTable(this);
  late final EmployeeDao employeeDao = EmployeeDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employeeTable];
}
