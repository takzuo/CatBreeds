import 'package:catbreeds/domain/responses/response.dart';

abstract class AuthenticationRepository{
  Future<String?> get accessToken;
  Future<Response> login(String email, String password);
}