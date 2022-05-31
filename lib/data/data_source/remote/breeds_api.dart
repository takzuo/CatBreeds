import 'dart:async';
import 'dart:io';
import 'package:catbreeds/data/helpers/http.dart';
import 'package:catbreeds/data/helpers/http_method.dart';
import 'package:catbreeds/domain/responses/response.dart';

class BreedsApi {
  final Http _http;

  BreedsApi(this._http);

  Future<Response> callBreedsAPI() async {
    final result = await _http.request<List<dynamic>>('/breeds',
        method: HttpMethod.get,
        headers: {"x-api-key:": "bda53789-d59e-46cd-9bc4-2936630fde39"},
        parser: (data) {
      return data;
    });

    if (result.error == null) {
      return Response.ok;
    }

    if (result.statusCode == 400) {
      return Response.accessDenied;
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return Response.networkError;
    }

    return Response.unknownError;
  }
}
