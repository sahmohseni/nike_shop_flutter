import 'package:nike/data/model/auth_refrsh/auth_refresh.dart';
import 'package:nike/di/locator.dart';
import 'package:nike/utils/http_client.dart';
import 'package:nike/utils/http_validator.dart';

abstract class IAuthDataSource {
  Future<AuthRefresh> login(String userName, String passWord);

  Future<AuthRefresh> register(String userName, String passWord);

  Future<AuthRefresh> refreshToken(String token);
}

class AuthDataSource with ResponseValidator implements IAuthDataSource {
  @override
  Future<AuthRefresh> login(String userName, String passWord) async {
    final getLoginResponse =
        await locator.get<HttpClient>().httpClient.post('auth/token', data: {
      'grant_type': 'password',
      'client_id': '2',
      'client_secret': 'kyj1c9sVcksqGU4scMX7nLDalkjp2WoqQEf8PKAC',
      'username': userName,
      'password': passWord
    });
    responseValidator(getLoginResponse);
    return AuthRefresh(
        accessToken: getLoginResponse.data['access_token'],
        refreshToken: getLoginResponse.data['refresh_token']);
  }

  @override
  Future<AuthRefresh> refreshToken(String token) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<AuthRefresh> register(String userName, String passWord) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
