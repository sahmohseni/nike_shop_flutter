// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_refresh.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthRefresh {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthRefreshCopyWith<AuthRefresh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthRefreshCopyWith<$Res> {
  factory $AuthRefreshCopyWith(
          AuthRefresh value, $Res Function(AuthRefresh) then) =
      _$AuthRefreshCopyWithImpl<$Res, AuthRefresh>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$AuthRefreshCopyWithImpl<$Res, $Val extends AuthRefresh>
    implements $AuthRefreshCopyWith<$Res> {
  _$AuthRefreshCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthRefreshCopyWith<$Res>
    implements $AuthRefreshCopyWith<$Res> {
  factory _$$_AuthRefreshCopyWith(
          _$_AuthRefresh value, $Res Function(_$_AuthRefresh) then) =
      __$$_AuthRefreshCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$_AuthRefreshCopyWithImpl<$Res>
    extends _$AuthRefreshCopyWithImpl<$Res, _$_AuthRefresh>
    implements _$$_AuthRefreshCopyWith<$Res> {
  __$$_AuthRefreshCopyWithImpl(
      _$_AuthRefresh _value, $Res Function(_$_AuthRefresh) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_AuthRefresh(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthRefresh implements _AuthRefresh {
  const _$_AuthRefresh({required this.accessToken, required this.refreshToken});

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthRefresh(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthRefresh &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthRefreshCopyWith<_$_AuthRefresh> get copyWith =>
      __$$_AuthRefreshCopyWithImpl<_$_AuthRefresh>(this, _$identity);
}

abstract class _AuthRefresh implements AuthRefresh {
  const factory _AuthRefresh(
      {required final String accessToken,
      required final String refreshToken}) = _$_AuthRefresh;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_AuthRefreshCopyWith<_$_AuthRefresh> get copyWith =>
      throw _privateConstructorUsedError;
}
