// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)
        unauthenticated,
    required TResult Function() authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)?
        unauthenticated,
    TResult? Function()? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)?
        unauthenticated,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthAuthenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthUnauthenticatedCopyWith<$Res> {
  factory _$$AuthUnauthenticatedCopyWith(_$AuthUnauthenticated value,
          $Res Function(_$AuthUnauthenticated) then) =
      __$$AuthUnauthenticatedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool busy,
      bool requiresEmailConfirmation,
      bool required2FAConfirmation,
      AuthErrorReason? error});
}

/// @nodoc
class __$$AuthUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnauthenticated>
    implements _$$AuthUnauthenticatedCopyWith<$Res> {
  __$$AuthUnauthenticatedCopyWithImpl(
      _$AuthUnauthenticated _value, $Res Function(_$AuthUnauthenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? busy = null,
    Object? requiresEmailConfirmation = null,
    Object? required2FAConfirmation = null,
    Object? error = freezed,
  }) {
    return _then(_$AuthUnauthenticated(
      busy: null == busy
          ? _value.busy
          : busy // ignore: cast_nullable_to_non_nullable
              as bool,
      requiresEmailConfirmation: null == requiresEmailConfirmation
          ? _value.requiresEmailConfirmation
          : requiresEmailConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      required2FAConfirmation: null == required2FAConfirmation
          ? _value.required2FAConfirmation
          : required2FAConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AuthErrorReason?,
    ));
  }
}

/// @nodoc

class _$AuthUnauthenticated extends AuthUnauthenticated {
  const _$AuthUnauthenticated(
      {this.busy = false,
      this.requiresEmailConfirmation = false,
      this.required2FAConfirmation = false,
      this.error})
      : super._();

  @override
  @JsonKey()
  final bool busy;
  @override
  @JsonKey()
  final bool requiresEmailConfirmation;
  @override
  @JsonKey()
  final bool required2FAConfirmation;
  @override
  final AuthErrorReason? error;

  @override
  String toString() {
    return 'AuthState.unauthenticated(busy: $busy, requiresEmailConfirmation: $requiresEmailConfirmation, required2FAConfirmation: $required2FAConfirmation, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUnauthenticated &&
            (identical(other.busy, busy) || other.busy == busy) &&
            (identical(other.requiresEmailConfirmation,
                    requiresEmailConfirmation) ||
                other.requiresEmailConfirmation == requiresEmailConfirmation) &&
            (identical(
                    other.required2FAConfirmation, required2FAConfirmation) ||
                other.required2FAConfirmation == required2FAConfirmation) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, busy, requiresEmailConfirmation,
      required2FAConfirmation, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUnauthenticatedCopyWith<_$AuthUnauthenticated> get copyWith =>
      __$$AuthUnauthenticatedCopyWithImpl<_$AuthUnauthenticated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)
        unauthenticated,
    required TResult Function() authenticated,
  }) {
    return unauthenticated(
        busy, requiresEmailConfirmation, required2FAConfirmation, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)?
        unauthenticated,
    TResult? Function()? authenticated,
  }) {
    return unauthenticated?.call(
        busy, requiresEmailConfirmation, required2FAConfirmation, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)?
        unauthenticated,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(
          busy, requiresEmailConfirmation, required2FAConfirmation, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthAuthenticated value) authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthAuthenticated value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthUnauthenticated extends AuthState {
  const factory AuthUnauthenticated(
      {final bool busy,
      final bool requiresEmailConfirmation,
      final bool required2FAConfirmation,
      final AuthErrorReason? error}) = _$AuthUnauthenticated;
  const AuthUnauthenticated._() : super._();

  bool get busy;
  bool get requiresEmailConfirmation;
  bool get required2FAConfirmation;
  AuthErrorReason? get error;
  @JsonKey(ignore: true)
  _$$AuthUnauthenticatedCopyWith<_$AuthUnauthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthAuthenticatedCopyWith<$Res> {
  factory _$$AuthAuthenticatedCopyWith(
          _$AuthAuthenticated value, $Res Function(_$AuthAuthenticated) then) =
      __$$AuthAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticated>
    implements _$$AuthAuthenticatedCopyWith<$Res> {
  __$$AuthAuthenticatedCopyWithImpl(
      _$AuthAuthenticated _value, $Res Function(_$AuthAuthenticated) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthAuthenticated extends AuthAuthenticated {
  const _$AuthAuthenticated() : super._();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)
        unauthenticated,
    required TResult Function() authenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)?
        unauthenticated,
    TResult? Function()? authenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool busy, bool requiresEmailConfirmation,
            bool required2FAConfirmation, AuthErrorReason? error)?
        unauthenticated,
    TResult Function()? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthUnauthenticated value) unauthenticated,
    required TResult Function(AuthAuthenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthUnauthenticated value)? unauthenticated,
    TResult? Function(AuthAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthUnauthenticated value)? unauthenticated,
    TResult Function(AuthAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthAuthenticated extends AuthState {
  const factory AuthAuthenticated() = _$AuthAuthenticated;
  const AuthAuthenticated._() : super._();
}
