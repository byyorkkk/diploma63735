// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pills_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PillsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PillDto> pills) ready,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PillDto> pills)? ready,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PillDto> pills)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PillsLoading value) loading,
    required TResult Function(PillsReady value) ready,
    required TResult Function(PillsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PillsLoading value)? loading,
    TResult? Function(PillsReady value)? ready,
    TResult? Function(PillsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PillsLoading value)? loading,
    TResult Function(PillsReady value)? ready,
    TResult Function(PillsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PillsStateCopyWith<$Res> {
  factory $PillsStateCopyWith(
          PillsState value, $Res Function(PillsState) then) =
      _$PillsStateCopyWithImpl<$Res, PillsState>;
}

/// @nodoc
class _$PillsStateCopyWithImpl<$Res, $Val extends PillsState>
    implements $PillsStateCopyWith<$Res> {
  _$PillsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PillsLoadingCopyWith<$Res> {
  factory _$$PillsLoadingCopyWith(
          _$PillsLoading value, $Res Function(_$PillsLoading) then) =
      __$$PillsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PillsLoadingCopyWithImpl<$Res>
    extends _$PillsStateCopyWithImpl<$Res, _$PillsLoading>
    implements _$$PillsLoadingCopyWith<$Res> {
  __$$PillsLoadingCopyWithImpl(
      _$PillsLoading _value, $Res Function(_$PillsLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PillsLoading implements PillsLoading {
  const _$PillsLoading();

  @override
  String toString() {
    return 'PillsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PillsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PillDto> pills) ready,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PillDto> pills)? ready,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PillDto> pills)? ready,
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
    required TResult Function(PillsLoading value) loading,
    required TResult Function(PillsReady value) ready,
    required TResult Function(PillsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PillsLoading value)? loading,
    TResult? Function(PillsReady value)? ready,
    TResult? Function(PillsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PillsLoading value)? loading,
    TResult Function(PillsReady value)? ready,
    TResult Function(PillsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PillsLoading implements PillsState {
  const factory PillsLoading() = _$PillsLoading;
}

/// @nodoc
abstract class _$$PillsReadyCopyWith<$Res> {
  factory _$$PillsReadyCopyWith(
          _$PillsReady value, $Res Function(_$PillsReady) then) =
      __$$PillsReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PillDto> pills});
}

/// @nodoc
class __$$PillsReadyCopyWithImpl<$Res>
    extends _$PillsStateCopyWithImpl<$Res, _$PillsReady>
    implements _$$PillsReadyCopyWith<$Res> {
  __$$PillsReadyCopyWithImpl(
      _$PillsReady _value, $Res Function(_$PillsReady) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pills = null,
  }) {
    return _then(_$PillsReady(
      pills: null == pills
          ? _value._pills
          : pills // ignore: cast_nullable_to_non_nullable
              as List<PillDto>,
    ));
  }
}

/// @nodoc

class _$PillsReady implements PillsReady {
  const _$PillsReady({required final List<PillDto> pills}) : _pills = pills;

  final List<PillDto> _pills;
  @override
  List<PillDto> get pills {
    if (_pills is EqualUnmodifiableListView) return _pills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pills);
  }

  @override
  String toString() {
    return 'PillsState.ready(pills: $pills)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PillsReady &&
            const DeepCollectionEquality().equals(other._pills, _pills));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pills));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PillsReadyCopyWith<_$PillsReady> get copyWith =>
      __$$PillsReadyCopyWithImpl<_$PillsReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PillDto> pills) ready,
    required TResult Function() error,
  }) {
    return ready(pills);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PillDto> pills)? ready,
    TResult? Function()? error,
  }) {
    return ready?.call(pills);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PillDto> pills)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(pills);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PillsLoading value) loading,
    required TResult Function(PillsReady value) ready,
    required TResult Function(PillsError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PillsLoading value)? loading,
    TResult? Function(PillsReady value)? ready,
    TResult? Function(PillsError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PillsLoading value)? loading,
    TResult Function(PillsReady value)? ready,
    TResult Function(PillsError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class PillsReady implements PillsState {
  const factory PillsReady({required final List<PillDto> pills}) = _$PillsReady;

  List<PillDto> get pills;
  @JsonKey(ignore: true)
  _$$PillsReadyCopyWith<_$PillsReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PillsErrorCopyWith<$Res> {
  factory _$$PillsErrorCopyWith(
          _$PillsError value, $Res Function(_$PillsError) then) =
      __$$PillsErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PillsErrorCopyWithImpl<$Res>
    extends _$PillsStateCopyWithImpl<$Res, _$PillsError>
    implements _$$PillsErrorCopyWith<$Res> {
  __$$PillsErrorCopyWithImpl(
      _$PillsError _value, $Res Function(_$PillsError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PillsError implements PillsError {
  const _$PillsError();

  @override
  String toString() {
    return 'PillsState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PillsError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<PillDto> pills) ready,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<PillDto> pills)? ready,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<PillDto> pills)? ready,
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
    required TResult Function(PillsLoading value) loading,
    required TResult Function(PillsReady value) ready,
    required TResult Function(PillsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PillsLoading value)? loading,
    TResult? Function(PillsReady value)? ready,
    TResult? Function(PillsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PillsLoading value)? loading,
    TResult Function(PillsReady value)? ready,
    TResult Function(PillsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PillsError implements PillsState {
  const factory PillsError() = _$PillsError;
}
