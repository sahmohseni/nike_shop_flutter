import 'package:nike/data/model/auth_refrsh/auth_refresh.dart';
import 'package:nike/data/source/auth_data_source.dart';
import 'package:nike/di/locator.dart';

abstract class IAuthRepository {
  Future<AuthRefresh> login(String userName, String passWord);

  Future<AuthRefresh> signUp(String userName, String passWord);
}

class AuthRepository implements IAuthRepository {
  @override
  Future<AuthRefresh> login(String userName, String passWord) {
    return locator.get<AuthDataSource>().login(userName, passWord);
  }

  @override
  Future<AuthRefresh> signUp(String userName, String passWord) {
    return locator.get<AuthDataSource>().signUp(userName, passWord);
  }
}
