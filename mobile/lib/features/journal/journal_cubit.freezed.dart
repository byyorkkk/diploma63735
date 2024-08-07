// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JournalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)
        ready,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalLoading value) loading,
    required TResult Function(JournalReady value) ready,
    required TResult Function(JournalError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalLoading value)? loading,
    TResult? Function(JournalReady value)? ready,
    TResult? Function(JournalError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalLoading value)? loading,
    TResult Function(JournalReady value)? ready,
    TResult Function(JournalError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalStateCopyWith<$Res> {
  factory $JournalStateCopyWith(
          JournalState value, $Res Function(JournalState) then) =
      _$JournalStateCopyWithImpl<$Res, JournalState>;
}

/// @nodoc
class _$JournalStateCopyWithImpl<$Res, $Val extends JournalState>
    implements $JournalStateCopyWith<$Res> {
  _$JournalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$JournalLoadingCopyWith<$Res> {
  factory _$$JournalLoadingCopyWith(
          _$JournalLoading value, $Res Function(_$JournalLoading) then) =
      __$$JournalLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JournalLoadingCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalLoading>
    implements _$$JournalLoadingCopyWith<$Res> {
  __$$JournalLoadingCopyWithImpl(
      _$JournalLoading _value, $Res Function(_$JournalLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JournalLoading implements JournalLoading {
  const _$JournalLoading();

  @override
  String toString() {
    return 'JournalState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JournalLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)
        ready,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalLoading value) loading,
    required TResult Function(JournalReady value) ready,
    required TResult Function(JournalError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalLoading value)? loading,
    TResult? Function(JournalReady value)? ready,
    TResult? Function(JournalError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalLoading value)? loading,
    TResult Function(JournalReady value)? ready,
    TResult Function(JournalError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class JournalLoading implements JournalState {
  const factory JournalLoading() = _$JournalLoading;
}

/// @nodoc
abstract class _$$JournalReadyCopyWith<$Res> {
  factory _$$JournalReadyCopyWith(
          _$JournalReady value, $Res Function(_$JournalReady) then) =
      __$$JournalReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CalendarRecordDto> sortedRecords, DateTime focusedDay});
}

/// @nodoc
class __$$JournalReadyCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalReady>
    implements _$$JournalReadyCopyWith<$Res> {
  __$$JournalReadyCopyWithImpl(
      _$JournalReady _value, $Res Function(_$JournalReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortedRecords = null,
    Object? focusedDay = null,
  }) {
    return _then(_$JournalReady(
      sortedRecords: null == sortedRecords
          ? _value._sortedRecords
          : sortedRecords // ignore: cast_nullable_to_non_nullable
              as List<CalendarRecordDto>,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$JournalReady implements JournalReady {
  const _$JournalReady(
      {required final List<CalendarRecordDto> sortedRecords,
      required this.focusedDay})
      : _sortedRecords = sortedRecords;

  final List<CalendarRecordDto> _sortedRecords;
  @override
  List<CalendarRecordDto> get sortedRecords {
    if (_sortedRecords is EqualUnmodifiableListView) return _sortedRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortedRecords);
  }

  @override
  final DateTime focusedDay;

  @override
  String toString() {
    return 'JournalState.ready(sortedRecords: $sortedRecords, focusedDay: $focusedDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalReady &&
            const DeepCollectionEquality()
                .equals(other._sortedRecords, _sortedRecords) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_sortedRecords), focusedDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalReadyCopyWith<_$JournalReady> get copyWith =>
      __$$JournalReadyCopyWithImpl<_$JournalReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)
        ready,
    required TResult Function() error,
  }) {
    return ready(sortedRecords, focusedDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult? Function()? error,
  }) {
    return ready?.call(sortedRecords, focusedDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(sortedRecords, focusedDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalLoading value) loading,
    required TResult Function(JournalReady value) ready,
    required TResult Function(JournalError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalLoading value)? loading,
    TResult? Function(JournalReady value)? ready,
    TResult? Function(JournalError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalLoading value)? loading,
    TResult Function(JournalReady value)? ready,
    TResult Function(JournalError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class JournalReady implements JournalState {
  const factory JournalReady(
      {required final List<CalendarRecordDto> sortedRecords,
      required final DateTime focusedDay}) = _$JournalReady;

  List<CalendarRecordDto> get sortedRecords;
  DateTime get focusedDay;
  @JsonKey(ignore: true)
  _$$JournalReadyCopyWith<_$JournalReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JournalErrorCopyWith<$Res> {
  factory _$$JournalErrorCopyWith(
          _$JournalError value, $Res Function(_$JournalError) then) =
      __$$JournalErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JournalErrorCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalError>
    implements _$$JournalErrorCopyWith<$Res> {
  __$$JournalErrorCopyWithImpl(
      _$JournalError _value, $Res Function(_$JournalError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JournalError implements JournalError {
  const _$JournalError();

  @override
  String toString() {
    return 'JournalState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JournalError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)
        ready,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<CalendarRecordDto> sortedRecords, DateTime focusedDay)?
        ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalLoading value) loading,
    required TResult Function(JournalReady value) ready,
    required TResult Function(JournalError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalLoading value)? loading,
    TResult? Function(JournalReady value)? ready,
    TResult? Function(JournalError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalLoading value)? loading,
    TResult Function(JournalReady value)? ready,
    TResult Function(JournalError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class JournalError implements JournalState {
  const factory JournalError() = _$JournalError;
}
