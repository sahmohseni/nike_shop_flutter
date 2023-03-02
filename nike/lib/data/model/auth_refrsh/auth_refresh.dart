import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_refresh.freezed.dart';

@freezed
class AuthRefresh with _$AuthRefresh {
  const factory AuthRefresh(
      {required String accessToken,
      required String refreshToken}) = _AuthRefresh;
}
