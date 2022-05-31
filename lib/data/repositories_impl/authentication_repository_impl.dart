import 'package:catbreeds/data/data_source/remote/authentication_api.dart';
import 'package:catbreeds/domain/repositories/authentication_repository.dart';
import 'package:catbreeds/domain/responses/response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{

  final AuthenticationAPI _api;

  AuthenticationRepositoryImpl(this._api);

  @override
  Future<String?> get accessToken async{
    await Future.delayed(const Duration(seconds: 1));
    return "null";
  }

  @override
  Future<Response> login(String email, String password) {
    return _api.login(email, password);
  }
  
}