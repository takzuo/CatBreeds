import 'dart:async';
import 'dart:io';

import 'package:catbreeds/data/helpers/http.dart';
import 'package:catbreeds/data/helpers/http_method.dart';
import 'package:catbreeds/domain/responses/response.dart';

class AuthenticationAPI{
  final Http _http;

  AuthenticationAPI(this._http);

  Future<Response> login(String email, String password) async {
  final result = await _http.request('/api/login', method: HttpMethod.post,
  body: {
    "email": email,
    "password": password,
  });

  print("result data ${result.data}");
  print("result data runtimetype ${result.data.runtimeType}");
  print("result error ${result.error?.data}");
  print("result statusCode ${result.statusCode}");





  if(result.error == null){
    return Response.ok;
  }

  if(result.statusCode == 400){
    return Response.accessDenied;
  }

  final error = result.error!.exception;

  if(error is SocketException || error is TimeoutException){
    return Response.networkError;
  }

  return Response.unknownError;

  }
}