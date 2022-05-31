import 'package:catbreeds/domain/responses/response.dart';

abstract class BreedsRepository {
  Future<Map<String, dynamic>> get catBreeds;

  Future<Response> callBreeds();
}
