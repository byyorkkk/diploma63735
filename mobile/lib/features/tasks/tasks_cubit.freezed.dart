// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TasksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)
        ready,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksReady value) ready,
    required TResult Function(TasksError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksReady value)? ready,
    TResult? Function(TasksError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksReady value)? ready,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TasksInitialCopyWith<$Res> {
  factory _$$TasksInitialCopyWith(
          _$TasksInitial value, $Res Function(_$TasksInitial) then) =
      __$$TasksInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksInitialCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksInitial>
    implements _$$TasksInitialCopyWith<$Res> {
  __$$TasksInitialCopyWithImpl(
      _$TasksInitial _value, $Res Function(_$TasksInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TasksInitial extends TasksInitial {
  const _$TasksInitial() : super._();

  @override
  String toString() {
    return 'TasksState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TasksInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)
        ready,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksReady value) ready,
    required TResult Function(TasksError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksReady value)? ready,
    TResult? Function(TasksError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksReady value)? ready,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TasksInitial extends TasksState {
  const factory TasksInitial() = _$TasksInitial;
  const TasksInitial._() : super._();
}

/// @nodoc
abstract class _$$TasksLoadingCopyWith<$Res> {
  factory _$$TasksLoadingCopyWith(
          _$TasksLoading value, $Res Function(_$TasksLoading) then) =
      __$$TasksLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksLoadingCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksLoading>
    implements _$$TasksLoadingCopyWith<$Res> {
  __$$TasksLoadingCopyWithImpl(
      _$TasksLoading _value, $Res Function(_$TasksLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TasksLoading extends TasksLoading {
  const _$TasksLoading() : super._();

  @override
  String toString() {
    return 'TasksState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TasksLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)
        ready,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
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
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksReady value) ready,
    required TResult Function(TasksError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksReady value)? ready,
    TResult? Function(TasksError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksReady value)? ready,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TasksLoading extends TasksState {
  const factory TasksLoading() = _$TasksLoading;
  const TasksLoading._() : super._();
}

/// @nodoc
abstract class _$$TasksReadyCopyWith<$Res> {
  factory _$$TasksReadyCopyWith(
          _$TasksReady value, $Res Function(_$TasksReady) then) =
      __$$TasksReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({Iterable<TaskDto> allTasks, DateTime selectedDay});
}

/// @nodoc
class __$$TasksReadyCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksReady>
    implements _$$TasksReadyCopyWith<$Res> {
  __$$TasksReadyCopyWithImpl(
      _$TasksReady _value, $Res Function(_$TasksReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTasks = null,
    Object? selectedDay = null,
  }) {
    return _then(_$TasksReady(
      allTasks: null == allTasks
          ? _value.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as Iterable<TaskDto>,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TasksReady extends TasksReady {
  const _$TasksReady({required this.allTasks, required this.selectedDay})
      : super._();

  @override
  final Iterable<TaskDto> allTasks;
  @override
  final DateTime selectedDay;

  @override
  String toString() {
    return 'TasksState.ready(allTasks: $allTasks, selectedDay: $selectedDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksReady &&
            const DeepCollectionEquality().equals(other.allTasks, allTasks) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(allTasks), selectedDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksReadyCopyWith<_$TasksReady> get copyWith =>
      __$$TasksReadyCopyWithImpl<_$TasksReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)
        ready,
    required TResult Function() error,
  }) {
    return ready(allTasks, selectedDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult? Function()? error,
  }) {
    return ready?.call(allTasks, selectedDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(allTasks, selectedDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksReady value) ready,
    required TResult Function(TasksError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksReady value)? ready,
    TResult? Function(TasksError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksReady value)? ready,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class TasksReady extends TasksState {
  const factory TasksReady(
      {required final Iterable<TaskDto> allTasks,
      required final DateTime selectedDay}) = _$TasksReady;
  const TasksReady._() : super._();

  Iterable<TaskDto> get allTasks;
  DateTime get selectedDay;
  @JsonKey(ignore: true)
  _$$TasksReadyCopyWith<_$TasksReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksErrorCopyWith<$Res> {
  factory _$$TasksErrorCopyWith(
          _$TasksError value, $Res Function(_$TasksError) then) =
      __$$TasksErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksErrorCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksError>
    implements _$$TasksErrorCopyWith<$Res> {
  __$$TasksErrorCopyWithImpl(
      _$TasksError _value, $Res Function(_$TasksError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TasksError extends TasksError {
  const _$TasksError() : super._();

  @override
  String toString() {
    return 'TasksState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TasksError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)
        ready,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Iterable<TaskDto> allTasks, DateTime selectedDay)? ready,
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
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksReady value) ready,
    required TResult Function(TasksError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TasksInitial value)? initial,
    TResult? Function(TasksLoading value)? loading,
    TResult? Function(TasksReady value)? ready,
    TResult? Function(TasksError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksReady value)? ready,
    TResult Function(TasksError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TasksError extends TasksState {
  const factory TasksError() = _$TasksError;
  const TasksError._() : super._();
}
